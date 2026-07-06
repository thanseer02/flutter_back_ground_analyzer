import 'package:flutter/widgets.dart';

abstract class AnalyticsTracker {
  void trackScreenView(String screenName, {Map<String, dynamic>? metadata});
}

class AnalyticsNavigatorObserver extends RouteObserver<ModalRoute<dynamic>> {
  final AnalyticsTracker _tracker;

  AnalyticsNavigatorObserver(this._tracker);

  void _sendScreenView(
    PageRoute<dynamic> route, {
    PageRoute<dynamic>? previousRoute,
  }) {
    final String screenName =
        route.settings.name ?? route.runtimeType.toString();
    _tracker.trackScreenView(
      screenName,
      metadata: {
        'route_name': route.settings.name,
        'previous_route': previousRoute?.settings.name,
      },
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(
        route,
        previousRoute: previousRoute is PageRoute ? previousRoute : null,
      );
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(
        newRoute,
        previousRoute: oldRoute is PageRoute ? oldRoute : null,
      );
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      // Send screen view for the route we are returning to
      _sendScreenView(previousRoute, previousRoute: route);
    }
  }
}
