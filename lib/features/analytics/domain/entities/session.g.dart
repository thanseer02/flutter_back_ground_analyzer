// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  sessionId: json['sessionId'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  totalForegroundDurationMs:
      (json['totalForegroundDurationMs'] as num?)?.toInt() ?? 0,
  totalBackgroundDurationMs:
      (json['totalBackgroundDurationMs'] as num?)?.toInt() ?? 0,
  totalIdleDurationMs: (json['totalIdleDurationMs'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'startedAt': instance.startedAt.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'totalForegroundDurationMs': instance.totalForegroundDurationMs,
  'totalBackgroundDurationMs': instance.totalBackgroundDurationMs,
  'totalIdleDurationMs': instance.totalIdleDurationMs,
  'isActive': instance.isActive,
};
