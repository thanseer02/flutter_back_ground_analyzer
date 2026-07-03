import 'package:flutter_background_analyser/features/analytics/domain/entities/session.dart';

abstract class SessionRepository {
  Future<void> saveSession(Session session);
  Future<Session?> getCurrentSession();
  Future<void> updateSession(Session session);
  Future<void> endSession(String sessionId);
  Future<void> clearSession();
}
