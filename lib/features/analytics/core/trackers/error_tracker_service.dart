import 'package:flutter/foundation.dart';

abstract class AnalyticsErrorTracker {
  void trackError(Object error, StackTrace stackTrace, {bool fatal = false});
}

class ErrorTrackerService {
  final AnalyticsErrorTracker _tracker;

  ErrorTrackerService(this._tracker);

  void initialize() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _tracker.trackError(details.exception, details.stack ?? StackTrace.empty, fatal: true);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      _tracker.trackError(error, stack, fatal: true);
      return true;
    };
  }
}
