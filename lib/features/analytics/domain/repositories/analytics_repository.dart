import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';

abstract class AnalyticsRepository {
  Future<void> saveEvent(AnalyticsEvent event);
  Future<List<AnalyticsEvent>> getPendingEvents();
  Future<void> removeEvents(List<String> eventIds);
  Future<void> clearAllEvents();
}
