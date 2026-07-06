import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_background_analyser/features/analytics/presentation/services/log_helper.dart';
import 'package:flutter_background_analyser/flutter_background_analyser.dart';

// Mock Services for Demo
class MockNetworkRepo implements NetworkRepository {
  @override
  Future<bool> isConnected() async => true;
}

class MockSessionRepo implements SessionRepository {
  @override
  Future<void> clearSession() async {}
  @override
  Future<Session?> getCurrentSession() async => null;
  @override
  Future<void> saveSession(Session session) async {}
  @override
  Future<void> updateSession(Session session) async {}
  @override
  Future<void> endSession(String sessionId) async {}
}

class ExampleMockUploadService implements AnalyticsUploadService {
  @override
  Future<bool> uploadBatch(List<AnalyticsEvent> events) async {
    printLogs(
      '\x1B[35m==================================================\x1B[0m',
    );
    printLogs(
      '\x1B[36m🚀 [ExampleMockUpload] Syncing ${events.length} logs to local stream...\x1B[0m',
    );
    printLogs(
      '\x1B[35m--------------------------------------------------\x1B[0m',
    );
    for (var i = 0; i < events.length; i++) {
      final e = events[i];
      String color = '\x1B[32m'; // Green
      String icon = '📝';

      final type = e.eventType.toString().toLowerCase();
      if (type.contains('error')) {
        color = '\x1B[31m'; // Red
        icon = '❌';
      } else if (type.contains('tap') || type.contains('gesture')) {
        color = '\x1B[33m'; // Yellow
        icon = '👆';
      } else if (type.contains('screen') || type.contains('viewed')) {
        color = '\x1B[34m'; // Blue
        icon = '👁️';
      } else if (type.contains('ground') || type.contains('lifecycle')) {
        color = '\x1B[36m'; // Cyan
        icon = '🔄';
      }

      printLogs(
        '$color[$icon Event #${i + 1}] Type: ${e.eventType} | Screen: ${e.screenName ?? "None"} | Res: ${e.screenResolution} | Id: ${e.installationId.substring(0, 8)}...\x1B[0m',
      );
      if (e.metadata.isNotEmpty) {
        printLogs('  \x1B[90m⚙️ Metadata: ${e.metadata}\x1B[0m');
      }
    }
    printLogs(
      '\x1B[35m==================================================\x1B[0m',
    );
    return true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool firebaseConnected = false;
  try {
    await Firebase.initializeApp();
    firebaseConnected = true;
  } catch (e) {
    printLogs(
      '\x1B[33m⚠️ Firebase not initialized. Using MockUploadService fallback simulations.\x1B[0m',
    );
  }

  // 1. Initialize Storage
  final storageService = HiveStorageService();
  await storageService.init();

  // 2. Setup Repositories & Managers
  final analyticsRepo = AnalyticsRepositoryImpl(storageService);
  final queueManager = QueueManager(analyticsRepo);
  final sessionManager = SessionManager(MockSessionRepo());
  final metadataService = DeviceMetadataService();

  // 3. Initialize core Facade
  final analytics = Analytics();
  await analytics.initialize(
    queueManager: queueManager,
    sessionManager: sessionManager,
    metadataService: metadataService,
    storageService: storageService,
  );

  // 4. Setup Sync Engine
  final uploadService = firebaseConnected
      ? FirebaseUploadService()
      : ExampleMockUploadService();
  final syncEngine = SyncEngine(queueManager, uploadService, MockNetworkRepo());
  syncEngine.startSyncTimer(
    interval: const Duration(seconds: 15),
  ); // rapid for demo!

  // 5. Setup Observers
  final lifecycleObserver = AppLifecycleObserver(analytics);
  lifecycleObserver.start();

  final errorTrackerService = ErrorTrackerService(analytics);
  errorTrackerService.initialize();

  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnalyticsGestureDetector(
      tracker: Analytics(),
      child: MaterialApp(
        title: 'Example Project Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorObservers: [AnalyticsNavigatorObserver(Analytics())],
        home: const ExampleHomeScreen(),
      ),
    );
  }
}

class ExampleHomeScreen extends StatefulWidget {
  const ExampleHomeScreen({super.key});

  @override
  State<ExampleHomeScreen> createState() => _ExampleHomeScreenState();
}

class _ExampleHomeScreenState extends State<ExampleHomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Analytics Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the button logic or simulate standard telemetry events below:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: Text('Counter Increment: $_counter'),
              onPressed: () {
                setState(() => _counter++);
                Analytics().recordEvent(
                  EventType.tap,
                  metadata: {
                    'tap_type': 'counter_button',
                    'increment_value': _counter,
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.slideshow),
              label: const Text('Navigate to Secondary Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: '/details-view'),
                    builder: (_) => const SecondaryScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.bug_report),
              label: const Text('Simulate Sandbox Crash'),
              onPressed: () {
                throw Exception("Example Sandbox Exception Triggered!");
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryScreen extends StatelessWidget {
  const SecondaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secondary Screen Page')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go back to Home'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
