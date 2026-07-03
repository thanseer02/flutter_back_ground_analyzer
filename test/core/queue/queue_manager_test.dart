import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_background_analyser/features/analytics/core/queue/queue_manager.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/event_type.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/analytics_repository.dart';

class MockAnalyticsRepository implements AnalyticsRepository {
  List<AnalyticsEvent> events = [];

  @override
  Future<void> clearAllEvents() async {
    events.clear();
  }

  @override
  Future<List<AnalyticsEvent>> getPendingEvents() async {
    return List.from(events);
  }

  @override
  Future<void> removeEvents(List<String> eventIds) async {
    events.removeWhere((e) => eventIds.contains(e.eventId));
  }

  @override
  Future<void> saveEvent(AnalyticsEvent event) async {
    events.add(event);
  }
}

AnalyticsEvent createTestEvent(String id, DateTime time) {
  return AnalyticsEvent(
    eventId: id,
    sessionId: 'session',
    timestamp: time,
    deviceTime: time,
    timezone: 'UTC',
    eventType: EventType.customEvent,
    appVersion: '1.0',
    buildNumber: '1',
    platform: 'test',
    osVersion: '1.0',
    deviceModel: 'test',
    locale: 'en',
    networkType: 'wifi',
  );
}

void main() {
  late MockAnalyticsRepository mockRepo;
  late QueueManager queueManager;

  setUp(() {
    mockRepo = MockAnalyticsRepository();
    queueManager = QueueManager(mockRepo, maxQueueSize: 3);
  });

  test('enqueue adds event to repository', () async {
    final event = createTestEvent('1', DateTime.now());
    await queueManager.enqueue(event);
    
    final pending = await mockRepo.getPendingEvents();
    expect(pending.length, 1);
    expect(pending.first.eventId, '1');
  });

  test('enqueue removes oldest event when maxQueueSize is reached', () async {
    final time = DateTime.now();
    await queueManager.enqueue(createTestEvent('1', time));
    await queueManager.enqueue(createTestEvent('2', time.add(const Duration(seconds: 1))));
    await queueManager.enqueue(createTestEvent('3', time.add(const Duration(seconds: 2))));
    
    // This should evict event '1' because maxQueueSize is 3
    await queueManager.enqueue(createTestEvent('4', time.add(const Duration(seconds: 3))));

    final pending = await mockRepo.getPendingEvents();
    expect(pending.length, 3);
    expect(pending.any((e) => e.eventId == '1'), false);
    expect(pending.any((e) => e.eventId == '2'), true);
    expect(pending.any((e) => e.eventId == '4'), true);
  });

  test('getBatch returns up to batchSize events sorted by time', () async {
    final time = DateTime.now();
    // Insert out of order
    await queueManager.enqueue(createTestEvent('2', time.add(const Duration(seconds: 1))));
    await queueManager.enqueue(createTestEvent('1', time));
    await queueManager.enqueue(createTestEvent('3', time.add(const Duration(seconds: 2))));

    final batch = await queueManager.getBatch(batchSize: 2);
    expect(batch.length, 2);
    expect(batch[0].eventId, '1');
    expect(batch[1].eventId, '2');
  });
}
