import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String sessionId,
    required DateTime startedAt,
    DateTime? endedAt,
    @Default(0) int totalForegroundDurationMs,
    @Default(0) int totalBackgroundDurationMs,
    @Default(0) int totalIdleDurationMs,
    required bool isActive,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
