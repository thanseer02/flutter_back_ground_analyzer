// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsEvent _$AnalyticsEventFromJson(Map<String, dynamic> json) =>
    _AnalyticsEvent(
      eventId: json['eventId'] as String,
      sessionId: json['sessionId'] as String,
      installationId: json['installationId'] as String,
      userId: json['userId'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      deviceTime: DateTime.parse(json['deviceTime'] as String),
      timezone: json['timezone'] as String,
      screenName: json['screenName'] as String?,
      eventType: $enumDecode(_$EventTypeEnumMap, json['eventType']),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      appVersion: json['appVersion'] as String,
      buildNumber: json['buildNumber'] as String,
      platform: json['platform'] as String,
      osVersion: json['osVersion'] as String,
      deviceModel: json['deviceModel'] as String,
      manufacturer: json['manufacturer'] as String?,
      screenResolution: json['screenResolution'] as String?,
      deviceOrientation: json['deviceOrientation'] as String?,
      locale: json['locale'] as String,
      networkType: json['networkType'] as String,
      batteryLevel: (json['batteryLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnalyticsEventToJson(_AnalyticsEvent instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'sessionId': instance.sessionId,
      'installationId': instance.installationId,
      'userId': instance.userId,
      'timestamp': instance.timestamp.toIso8601String(),
      'deviceTime': instance.deviceTime.toIso8601String(),
      'timezone': instance.timezone,
      'screenName': instance.screenName,
      'eventType': _$EventTypeEnumMap[instance.eventType]!,
      'metadata': instance.metadata,
      'appVersion': instance.appVersion,
      'buildNumber': instance.buildNumber,
      'platform': instance.platform,
      'osVersion': instance.osVersion,
      'deviceModel': instance.deviceModel,
      'manufacturer': instance.manufacturer,
      'screenResolution': instance.screenResolution,
      'deviceOrientation': instance.deviceOrientation,
      'locale': instance.locale,
      'networkType': instance.networkType,
      'batteryLevel': instance.batteryLevel,
    };

const _$EventTypeEnumMap = {
  EventType.appOpened: 'appOpened',
  EventType.appClosed: 'appClosed',
  EventType.sessionStarted: 'sessionStarted',
  EventType.sessionEnded: 'sessionEnded',
  EventType.screenViewed: 'screenViewed',
  EventType.screenExited: 'screenExited',
  EventType.tap: 'tap',
  EventType.swipe: 'swipe',
  EventType.scroll: 'scroll',
  EventType.longPress: 'longPress',
  EventType.doubleTap: 'doubleTap',
  EventType.idle: 'idle',
  EventType.resume: 'resume',
  EventType.background: 'background',
  EventType.foreground: 'foreground',
  EventType.syncStarted: 'syncStarted',
  EventType.syncCompleted: 'syncCompleted',
  EventType.syncFailed: 'syncFailed',
  EventType.error: 'error',
  EventType.customEvent: 'customEvent',
};
