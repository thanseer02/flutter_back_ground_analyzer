import 'dart:async';
import 'dart:math';
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
    if (!isConnected) return;

    _isSyncing = true;

    try {
      while (true) {
        final batch = await _queueManager.getBatch();
        if (batch.isEmpty) break;

        final success = await _uploadService.uploadBatch(batch);
        
        if (success) {
          final ids = batch.map((e) => e.eventId).toList();
          await _queueManager.removeProcessed(ids);
          _retryCount = 0; // reset on success
        } else {
          _handleFailure();
          break; // Stop syncing this cycle
        }
      }
    } catch (e) {
      _handleFailure();
    } finally {
      _isSyncing = false;
    }
  }

  void _handleFailure() {
    _retryCount++;
    if (_retryCount <= _maxRetries) {
      // Exponential backoff
      final delaySeconds = pow(2, _retryCount).toInt();
      Future.delayed(Duration(seconds: delaySeconds), syncNow);
    }
  }
}
