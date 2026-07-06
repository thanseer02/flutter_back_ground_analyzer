import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_background_analyser/features/analytics/core/uploader/analytics_upload_service.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/presentation/services/log_helper.dart';

class FirebaseUploadService implements AnalyticsUploadService {
  final FirebaseFirestore _firestore;
  final FirebaseAnalytics _analytics;

  FirebaseUploadService({
    FirebaseFirestore? firestore,
    FirebaseAnalytics? analytics,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _analytics = analytics ?? FirebaseAnalytics.instance;

  @override
  Future<bool> uploadBatch(List<AnalyticsEvent> events) async {
    if (events.isEmpty) {
      printLogs('🔥 [FirebaseUploadService] No events to upload.');
      return true;
    }

    if (Firebase.apps.isEmpty) {
      printLogs(
        '🔥 [FirebaseUploadService] Firebase is not initialized. Skipping upload.',
      );
      return true;
    }

    try {
      printLogs(
        '🔥 [FirebaseUploadService] Uploading ${events.length} event(s) to Firestore...',
      );
      final batch = _firestore.batch();

      for (final event in events) {
        final installationId = event.installationId.isNotEmpty
            ? event.installationId
            : 'anonymous_device';
        final sessionId = event.sessionId.isNotEmpty
            ? event.sessionId
            : 'unknown_session';
        final eventId = event.eventId;

        final docRef = _firestore
            .collection('background_analyzer')
            .doc(installationId)
            .collection('sessions')
            .doc(sessionId)
            .collection('events')
            .doc(eventId);

        final data = {
          'eventId': event.eventId,
          'sessionId': event.sessionId,
          'installationId': event.installationId,
          'userId': event.userId,
          'timestamp': Timestamp.fromDate(event.timestamp),
          'deviceTime': Timestamp.fromDate(event.deviceTime),
          'timezone': event.timezone,
          'screenName': event.screenName,
          'eventType': event.eventType.name,
          'metadata': event.metadata,
          'appVersion': event.appVersion,
          'buildNumber': event.buildNumber,
          'platform': event.platform,
          'osVersion': event.osVersion,
          'deviceModel': event.deviceModel,
          'manufacturer': event.manufacturer,
          'screenResolution': event.screenResolution,
          'deviceOrientation': event.deviceOrientation,
          'locale': event.locale,
          'networkType': event.networkType,
          'batteryLevel': event.batteryLevel,
        };

        batch.set(docRef, data);
      }

      await batch.commit();
      printLogs(
        '✅ [FirebaseUploadService] Firestore batch commit succeeded for ${events.length} event(s).',
      );

      // Mirror events to Firebase Analytics in parallel triggers
      for (final event in events) {
        _mirrorToFirebaseAnalytics(event);
      }

      return true;
    } catch (e) {
      printLogs(
        '❌ [FirebaseUploadService] Failed to upload events to Firestore: $e',
      );
      return false;
    }
  }

  Future<void> _mirrorToFirebaseAnalytics(AnalyticsEvent e) async {
    try {
      printLogs(
        '🔁 [FirebaseUploadService] Mirroring event ${e.eventId} to Firebase Analytics.',
      );
      if (e.userId != null && e.userId!.isNotEmpty) {
        await _analytics.setUserId(id: e.userId);
      }

      final name = e.eventType.name.toLowerCase();
      final parameters = <String, Object>{
        'event_id': e.eventId,
        'session_id': e.sessionId,
        'installation_id': e.installationId,
        'platform': e.platform,
        'device_model': e.deviceModel,
        for (final entry in e.metadata.entries)
          if (entry.value != null) entry.key: entry.value as Object,
      };

      if (name.contains('viewed') || name.contains('screen')) {
        await _analytics.logScreenView(
          screenName: e.screenName ?? 'unknown_screen',
        );
      } else if (name.contains('tap') || name.contains('gesture')) {
        await _analytics.logEvent(name: 'button_click', parameters: parameters);
      } else if (name.contains('foreground') || name.contains('open')) {
        await _analytics.logAppOpen();
      } else if (name.contains('background') || name.contains('close')) {
        await _analytics.logEvent(name: 'app_close', parameters: parameters);
      } else if (name.contains('error')) {
        await _analytics.logEvent(
          name: 'error',
          parameters: <String, Object>{
            'error_message': e.metadata['error']?.toString() ?? 'Unknown Error',
            ...parameters,
          },
        );
      } else {
        await _analytics.logEvent(name: 'custom_event', parameters: parameters);
      }
    } catch (_) {
      // Failures in mirroring do not block main analytics stream
    }
  }
}
