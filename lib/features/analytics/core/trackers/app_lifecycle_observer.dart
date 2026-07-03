import 'package:flutter/widgets.dart';

abstract class AnalyticsLifecycleTracker {
  void trackLifecycle(AppLifecycleState state);
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  final AnalyticsLifecycleTracker _tracker;

  AppLifecycleObserver(this._tracker);

  void start() {
    WidgetsBinding.instance.addObserver(this);
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _tracker.trackLifecycle(state);
  }
}
