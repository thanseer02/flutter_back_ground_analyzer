import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/event_type.dart';

void main() {
  test('AnalyticsEvent JSON serialization', () {
    final time = DateTime.parse("2024-01-01T12:00:00.000Z");
    
    final event = AnalyticsEvent(
      eventId: '123',
      sessionId: 'abc',
      installationId: 'test_inst_id',
      timestamp: time,
      deviceTime: time,
      timezone: 'UTC',
      eventType: EventType.screenViewed,
      screenName: 'Home',
      metadata: {'key': 'value'},
      appVersion: '1.0.0',
      buildNumber: '42',
      platform: 'ios',
      osVersion: '17.0',
      deviceModel: 'iPhone 15',
      locale: 'en_US',
      networkType: 'wifi',
    );

    final json = event.toJson();
    
    expect(json['eventId'], '123');
    expect(json['eventType'], 'screenViewed');
    expect(json['screenName'], 'Home');
    expect(json['metadata']['key'], 'value');
    expect(json['platform'], 'ios');

    final parsedEvent = AnalyticsEvent.fromJson(json);
    expect(parsedEvent.eventId, '123');
    expect(parsedEvent.eventType, EventType.screenViewed);
    expect(parsedEvent.screenName, 'Home');
    expect(parsedEvent.timestamp, time);
  });
}
