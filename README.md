# Background Analytics Recorder

A production-ready, modular, and privacy-aware background analytics recorder for Flutter applications. Built strictly using Clean Architecture principles, this library allows developers to gather deep insights into user interactions, screen navigation, and application health without sacrificing UI performance or user privacy.

## Features

- **📊 Comprehensive Screen Tracking**: Automatically intercepts routing events and calculates the time spent on each screen (supports Navigator 1.0, 2.0, GoRouter, AutoRoute, etc. out-of-the-box).
- **🔋 Battery-Efficient Offline Buffering**: Uses a high-performance local Hive storage engine to buffer events locally in a FIFO queue when the device is offline.
- **🔄 Smart Sync Engine**: Uploads events in batches automatically when network connectivity is restored using an Exponential Backoff strategy to prevent bandwidth flooding.
- **👆 Privacy-First Touch Analytics**: Global gesture tracking wraps the entire application using a custom `Listener`, heuristically identifying taps, double-taps, and scrolling frequencies **without** capturing any precise coordinate data.
- **⏳ Lifecycle & Session Management**: Tracks app backgrounds, foregrounds, and idleness. Automatically calculates continuous session lengths and drops stale sessions securely.
- **🛡️ Enterprise-Grade Error Tracking**: Implements global error boundaries leveraging `FlutterError` and `PlatformDispatcher` to log unhandled crashes natively to your backend.
- **🏗️ Clean Architecture**: Completely decoupled Domain, Data, and Core layers making it ready to be exported into its own independent Flutter package.

---

## 🏗 Architecture

```
lib/features/analytics/
  ├── core/               # Infrastructure (Storage, Queue, Sync Engine, Observers)
  ├── data/               # Implementations of Domain Repositories & DTOs
  ├── domain/             # Abstract Entities (AnalyticsEvent, Session), Enums, Interfaces
  └── presentation/       # Analytics Facade & Public APIs
```

---

## 🚀 Setup & Initialization

Ensure your `pubspec.yaml` has the required dependencies (Hive, Freezed, Device Info Plus). 
Initialize the system before running your Flutter application:

```dart
import 'package:flutter_background_analyser/features/analytics/presentation/services/analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Storage
  final storageService = HiveStorageService();
  await storageService.init();

  // 2. Setup the primary facade
  final analytics = Analytics();
  await analytics.initialize(
    queueManager: QueueManager(AnalyticsRepositoryImpl(storageService)),
    sessionManager: SessionManager(MockSessionRepo()),
    metadataService: DeviceMetadataService(),
  );

  // 3. (Optional) Boot background sync engine
  final syncEngine = SyncEngine(QueueManager(...), MockUploadService(), MockNetworkRepo());
  syncEngine.startSyncTimer();

  runApp(const MyApp());
}
```

---

## 🛠️ Usage

### 1. Global Navigation & Touch Wrapping

You don't need to manually inject analytics code on every screen. Wrap your `MaterialApp` with the built-in observers:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnalyticsGestureDetector(
      tracker: Analytics(),
      child: MaterialApp(
        navigatorObservers: [
          AnalyticsNavigatorObserver(Analytics()),
        ],
        home: const HomeScreen(),
      ),
    );
  }
}
```

### 2. Manual Custom Events

If you need to track specific domain logic (e.g., checkout completed):

```dart
Analytics().recordEvent(
  EventType.customEvent, 
  metadata: {
    'action': 'checkout',
    'cart_value': 150.00,
  }
);
```

### 3. User Identity

To attach analytics payloads to specific users:

```dart
Analytics().setUserId("user_abc_123");
```

---

## ⚙️ Offline Engine Mechanics

- **Queue Limits**: The internal `QueueManager` operates at a default limit of `1000` events to avoid device memory bloat. Older items are pruned automatically.
- **Batching**: The `SyncEngine` pulls events from the queue in adjustable batch sizes. 
- **Resilience**: If an upload fails, the engine delays the next attempt by 2 seconds, then 4s, 8s, 16s... up to a maximum limit, preventing extreme battery drain when APIs are unstable.

## 🤝 Code Quality

- **Immutable Models**: Powered by `freezed` and `json_serializable`.
- **Thoroughly Tested**: Includes a suite of Unit Tests validating offline queue edge-cases and JSON consistency.
- **SOLID & DRY**: Built with absolute dependency injection support (swapping Hive for Isar or SQLite is as easy as providing a new `AnalyticsRepository` implementation).
