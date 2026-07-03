import 'package:flutter/widgets.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/event_type.dart';

abstract class AnalyticsGestureTracker {
  void trackGesture(EventType eventType, {Map<String, dynamic>? metadata});
}

class AnalyticsGestureDetector extends StatefulWidget {
  final Widget child;
  final AnalyticsGestureTracker tracker;

  const AnalyticsGestureDetector({
    super.key,
    required this.child,
    required this.tracker,
  });

  @override
  State<AnalyticsGestureDetector> createState() => _AnalyticsGestureDetectorState();
}

class _AnalyticsGestureDetectorState extends State<AnalyticsGestureDetector> {
  DateTime? _lastTapDown;
  int _tapCount = 0;

  void _handlePointerDown(PointerDownEvent event) {
    final now = DateTime.now();
    if (_lastTapDown != null) {
      if (now.difference(_lastTapDown!).inMilliseconds < 300) {
        _tapCount++;
      } else {
        _tapCount = 1;
      }
    } else {
      _tapCount = 1;
    }
    _lastTapDown = now;

    if (_tapCount == 2) {
      widget.tracker.trackGesture(EventType.doubleTap);
    } else if (_tapCount == 1) {
      widget.tracker.trackGesture(EventType.tap);
    }
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (event.delta.dx.abs() > 2.0 || event.delta.dy.abs() > 2.0) {
      // simple scroll/swipe heuristic
      widget.tracker.trackGesture(EventType.scroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointerDown,
      onPointerMove: _handlePointerMove,
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}
