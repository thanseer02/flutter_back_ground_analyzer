import 'package:flutter_background_analyser/features/analytics/core/queue/queue_manager.dart';
import 'package:flutter_background_analyser/features/analytics/core/recorder/device_metadata_service.dart';
import 'package:flutter_background_analyser/features/analytics/core/session/session_manager.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/analytics_gesture_detector.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/analytics_navigator_observer.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/app_lifecycle_observer.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/event_type.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/error_tracker_service.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class Analytics implements AnalyticsTracker, AnalyticsGestureTracker, AnalyticsLifecycleTracker, AnalyticsErrorTracker {
  static final Analytics _instance = Analytics._internal();
  factory Analytics() => _instance;
  Analytics._internal();

  late QueueManager _queueManager;
  late SessionManager _sessionManager;
  late DeviceMetadataService _metadataService;
  
  String? _userId;

  Future<void> initialize({
    required QueueManager queueManager,
    required SessionManager sessionManager,
    required DeviceMetadataService metadataService,
  }) async {
    _queueManager = queueManager;
    _sessionManager = sessionManager;
    _metadataService = metadataService;
    
    await _metadataService.initialize();
    await _sessionManager.startSession();
  }

  void setUserId(String userId) {
    _userId = userId;
  }

  Future<void> recordEvent(EventType type, {Map<String, dynamic>? metadata, String? screenName}) async {
    await _sessionManager.registerActivity();
    
    final event = AnalyticsEvent(
      eventId: const Uuid().v4(),
      sessionId: _sessionManager.currentSessionId ?? 'unknown',
      userId: _userId,
      timestamp: DateTime.now().toUtc(),
      deviceTime: DateTime.now(),
      timezone: DateTime.now().timeZoneName,
      screenName: screenName,
      eventType: type,
      metadata: metadata ?? const {},
      appVersion: _metadataService.appVersion,
      buildNumber: _metadataService.buildNumber,
      platform: _metadataService.platform,
      osVersion: _metadataService.osVersion,
      deviceModel: _metadataService.deviceModel,
      locale: _metadataService.locale,
      networkType: 'unknown', // Set this from a network service if needed
    );

    await _queueManager.enqueue(event);
  }

  @override
  void trackScreenView(String screenName, {Map<String, dynamic>? metadata}) {
    recordEvent(EventType.screenViewed, screenName: screenName, metadata: metadata);
  }

  @override
  void trackGesture(EventType eventType, {Map<String, dynamic>? metadata}) {
    recordEvent(eventType, metadata: metadata);
  }

  @override
  void trackLifecycle(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      recordEvent(EventType.foreground);
      _sessionManager.registerActivity();
    } else if (state == AppLifecycleState.paused) {
      recordEvent(EventType.background);
    }
  }

  @override
  void trackError(Object error, StackTrace stackTrace, {bool fatal = false}) {
    recordEvent(EventType.error, metadata: {
      'error': error.toString(),
      'stackTrace': stackTrace.toString(),
      'fatal': fatal,
    });
  }
}
