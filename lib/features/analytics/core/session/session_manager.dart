import 'dart:async';
import 'package:flutter_background_analyser/features/analytics/domain/entities/session.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/session_repository.dart';
import 'package:uuid/uuid.dart';

class SessionManager {
  final SessionRepository _repository;
  Session? _currentSession;
  Timer? _sessionTimeoutTimer;
  
  static const Duration sessionTimeoutDuration = Duration(minutes: 30);

  SessionManager(this._repository);

  Future<void> startSession() async {
    final now = DateTime.now();
    _currentSession = Session(
      sessionId: const Uuid().v4(),
      startedAt: now,
      isActive: true,
    );
    await _repository.saveSession(_currentSession!);
  }

  Future<void> endSession() async {
    if (_currentSession != null) {
      _currentSession = _currentSession!.copyWith(
        endedAt: DateTime.now(),
        isActive: false,
      );
      await _repository.updateSession(_currentSession!);
      _currentSession = null;
      _sessionTimeoutTimer?.cancel();
    }
  }

  Future<void> registerActivity() async {
    _resetSessionTimeout();
    
    if (_currentSession == null) {
      await startSession();
    }
  }

  void _resetSessionTimeout() {
    _sessionTimeoutTimer?.cancel();
    _sessionTimeoutTimer = Timer(sessionTimeoutDuration, () {
      endSession();
    });
  }
  
  String? get currentSessionId => _currentSession?.sessionId;
}
