import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_background_analyser/features/analytics/core/queue/queue_manager.dart';
import 'package:flutter_background_analyser/features/analytics/core/uploader/analytics_upload_service.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/network_repository.dart';

class SyncEngine {
  final QueueManager _queueManager;
  final AnalyticsUploadService _uploadService;
  final NetworkRepository _networkRepository;

  Timer? _syncTimer;
  bool _isSyncing = false;
  int _retryCount = 0;
  final int _maxRetries = 5;

  SyncEngine(this._queueManager, this._uploadService, this._networkRepository);

  void startSyncTimer({Duration interval = const Duration(minutes: 5)}) {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(interval, (_) => syncNow());
  }

  void stop() {
    _syncTimer?.cancel();
  }

  Future<void> syncNow() async {
    if (_isSyncing) return;

    final isConnected = await _networkRepository.isConnected();
    if (!isConnected) {
      debugPrint('ℹ️ [SyncEngine] No network connectivity. Sync deferred.');
      return;
    }

    _isSyncing = true;
    debugPrint('ℹ️ [SyncEngine] Starting sync cycle.');

    try {
      while (true) {
        final batch = await _queueManager.getBatch();
        if (batch.isEmpty) {
          debugPrint('ℹ️ [SyncEngine] No pending events to sync.');
          break;
        }

        debugPrint(
          'ℹ️ [SyncEngine] Attempting upload for ${batch.length} pending event(s).',
        );
        final success = await _uploadService.uploadBatch(batch);

        if (success) {
          final ids = batch.map((e) => e.eventId).toList();
          await _queueManager.removeProcessed(ids);
          debugPrint(
            '✅ [SyncEngine] Uploaded ${batch.length} event(s) and removed processed items.',
          );
          _retryCount = 0; // reset on success
        } else {
          _handleFailure();
          break; // Stop syncing this cycle
        }
      }
    } catch (e) {
      debugPrint('❌ [SyncEngine] Sync cycle failed: $e');
      _handleFailure();
    } finally {
      _isSyncing = false;
      debugPrint('ℹ️ [SyncEngine] Sync cycle completed.');
    }
  }

  void _handleFailure() {
    _retryCount++;
    if (_retryCount <= _maxRetries) {
      final delaySeconds = pow(2, _retryCount).toInt();
      debugPrint(
        '⚠️ [SyncEngine] Upload failed. Retrying in $delaySeconds seconds (attempt $_retryCount/$_maxRetries).',
      );
      Future.delayed(Duration(seconds: delaySeconds), syncNow);
    } else {
      debugPrint(
        '❌ [SyncEngine] Maximum retry attempts reached. Giving up until next sync cycle.',
      );
    }
  }
}
