import 'package:flutter_background_analyser/features/analytics/core/storage/hive_storage_service.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final HiveStorageService _storageService;

  AnalyticsRepositoryImpl(this._storageService);

  @override
  Future<void> saveEvent(AnalyticsEvent event) async {
    await _storageService.saveEvent(event);
  }

  @override
  Future<List<AnalyticsEvent>> getPendingEvents() async {
    return await _storageService.getEvents();
  }

  @override
  Future<void> removeEvents(List<String> eventIds) async {
    await _storageService.removeEvents(eventIds);
  }

  @override
  Future<void> clearAllEvents() async {
    await _storageService.clearAll();
  }
}
