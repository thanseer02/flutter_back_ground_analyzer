import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/analytics_repository.dart';

class QueueManager {
  final AnalyticsRepository _repository;
  final int maxQueueSize;

  QueueManager(this._repository, {this.maxQueueSize = 1000});

  Future<void> enqueue(AnalyticsEvent event) async {
    final pending = await _repository.getPendingEvents();
    if (pending.length >= maxQueueSize) {
      // Remove oldest event to make room
      pending.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      await _repository.removeEvents([pending.first.eventId]);
    }
    await _repository.saveEvent(event);
  }

  Future<List<AnalyticsEvent>> getBatch({int batchSize = 50}) async {
    final pending = await _repository.getPendingEvents();
    pending.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return pending.take(batchSize).toList();
  }

  Future<void> removeProcessed(List<String> eventIds) async {
    await _repository.removeEvents(eventIds);
  }
}
