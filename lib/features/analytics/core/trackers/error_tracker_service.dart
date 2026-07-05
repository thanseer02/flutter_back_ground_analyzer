import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class AnalyticsErrorTracker {
  void trackError(Object error, StackTrace stackTrace, {bool fatal = false});
}

class ErrorTrackerService {
  final AnalyticsErrorTracker _tracker;

  ErrorTrackerService(this._tracker);

  void initialize() {
    // Intercept Flutter framework exceptions
    FlutterError.onError = (FlutterErrorDetails details) {
      _tracker.trackError(details.exception, details.stack ?? StackTrace.current, fatal: true);
      if (Firebase.apps.isNotEmpty) {
        FirebaseCrashlytics.instance.recordError(
          details.exception,
          details.stack,
          fatal: true,
        );
      }
      // Forward to default handler
      FlutterError.presentError(details);
    };

    // Intercept platform/async exceptions
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _tracker.trackError(error, stack, fatal: false);
      if (Firebase.apps.isNotEmpty) {
        FirebaseCrashlytics.instance.recordError(
          error,
          stack,
          fatal: false,
        );
      }
      return true;
    };
  }
}
