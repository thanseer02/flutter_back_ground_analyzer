import 'package:freezed_annotation/freezed_annotation.dart';
import 'event_type.dart';

part 'analytics_event.freezed.dart';
part 'analytics_event.g.dart';

@freezed
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent({
    required String eventId,
    required String sessionId,
    String? userId,
    required DateTime timestamp,
    required DateTime deviceTime,
    required String timezone,
    String? screenName,
    required EventType eventType,
    @Default({}) Map<String, dynamic> metadata,
    required String appVersion,
    required String buildNumber,
    required String platform,
    required String osVersion,
    required String deviceModel,
    required String locale,
    required String networkType,
    int? batteryLevel,
  }) = _AnalyticsEvent;

  factory AnalyticsEvent.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsEventFromJson(json);
}
