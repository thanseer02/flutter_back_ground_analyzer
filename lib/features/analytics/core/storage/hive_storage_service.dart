import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';

class HiveStorageService {
  static const String _boxName = 'analytics_events_box';
  late Box<String> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<void> saveEvent(AnalyticsEvent event) async {
    await _box.put(event.eventId, jsonEncode(event.toJson()));
  }

  Future<List<AnalyticsEvent>> getEvents() async {
    final List<AnalyticsEvent> events = [];
    for (var key in _box.keys) {
      final String? jsonStr = _box.get(key);
      if (jsonStr != null) {
        try {
          events.add(AnalyticsEvent.fromJson(jsonDecode(jsonStr)));
        } catch (e) {
          // Ignore malformed events
        }
      }
    }
    return events;
  }

  Future<void> removeEvents(List<String> eventIds) async {
    await _box.deleteAll(eventIds);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
