import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';

abstract class AnalyticsUploadService {
  Future<bool> uploadBatch(List<AnalyticsEvent> events);
}
