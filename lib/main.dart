import 'package:flutter/material.dart';
import 'package:flutter_background_analyser/features/analytics/core/queue/queue_manager.dart';
import 'package:flutter_background_analyser/features/analytics/core/recorder/device_metadata_service.dart';
import 'package:flutter_background_analyser/features/analytics/core/session/session_manager.dart';
import 'package:flutter_background_analyser/features/analytics/core/storage/hive_storage_service.dart';
import 'package:flutter_background_analyser/features/analytics/core/sync/sync_engine.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/analytics_gesture_detector.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/analytics_navigator_observer.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/app_lifecycle_observer.dart';
import 'package:flutter_background_analyser/features/analytics/core/trackers/error_tracker_service.dart';
import 'package:flutter_background_analyser/features/analytics/data/repositories/analytics_repository_impl.dart';
import 'package:flutter_background_analyser/features/analytics/presentation/services/analytics.dart';

// Mock Services for Demo
import 'package:flutter_background_analyser/features/analytics/domain/repositories/network_repository.dart';
import 'package:flutter_background_analyser/features/analytics/domain/repositories/session_repository.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/session.dart';
import 'package:flutter_background_analyser/features/analytics/core/uploader/analytics_upload_service.dart';
import 'package:flutter_background_analyser/features/analytics/domain/entities/analytics_event.dart';

class MockNetworkRepo implements NetworkRepository {
  @override Future<bool> isConnected() async => true;
}
class MockSessionRepo implements SessionRepository {
  @override Future<void> clearSession() async {}
  @override Future<Session?> getCurrentSession() async => null;
  @override Future<void> saveSession(Session session) async {}
  @override Future<void> updateSession(Session session) async {}
  @override Future<void> endSession(String sessionId) async {}
}
class MockUploadService implements AnalyticsUploadService {
  @override Future<bool> uploadBatch(List<AnalyticsEvent> events) async {
    debugPrint('[MockUploadService] Uploading ${events.length} events...');
    for (var e in events) {
      debugPrint('  -> Event: ${e.eventType} | Screen: ${e.screenName}');
    }
    return true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Storage
  final storageService = HiveStorageService();
  await storageService.init();

  // 2. Setup Repositories & Managers
  final analyticsRepo = AnalyticsRepositoryImpl(storageService);
  final queueManager = QueueManager(analyticsRepo);
  final sessionManager = SessionManager(MockSessionRepo());
  final metadataService = DeviceMetadataService();

  // 3. Initialize the core Analytics Facade
  final analytics = Analytics();
  await analytics.initialize(
    queueManager: queueManager,
    sessionManager: sessionManager,
    metadataService: metadataService,
  );

  // 4. Setup Sync Engine
  final syncEngine = SyncEngine(queueManager, MockUploadService(), MockNetworkRepo());
  syncEngine.startSyncTimer(interval: const Duration(seconds: 30)); // fast for testing

  // 5. Setup Observers
  final lifecycleObserver = AppLifecycleObserver(analytics);
  lifecycleObserver.start();

  final errorTrackerService = ErrorTrackerService(analytics);
  errorTrackerService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 6. Wrap app with gesture detector for generic touch analytics
    return AnalyticsGestureDetector(
      tracker: Analytics(),
      child: MaterialApp(
        title: 'Analytics Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // 7. Inject Navigation Observer
        navigatorObservers: [
          AnalyticsNavigatorObserver(Analytics()),
        ],
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  settings: const RouteSettings(name: '/details'),
                  builder: (_) => const DetailsScreen(),
                ));
              },
              child: const Text('Go to Details'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate crash
                throw Exception("Simulated Crash!");
              },
              child: const Text('Simulate Crash'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
