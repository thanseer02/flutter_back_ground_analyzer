import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

// ─────────────────────────────────────────────────────────────────────────────
// printApiResponse
// ─────────────────────────────────────────────────────────────────────────────

/// Prints a clean, structured log entry to the Flutter debug console.
///
/// Uses [developer.log] so entries appear in the **Flutter DevTools › Logging**
/// tab with proper grouping, and are completely silent in release builds.
///
/// ## Parameters
/// - [object]     — The data to log (Map, List, String, or anything).
/// - [head]       — A short label for the log source, e.g. `'[NFC]'`.
/// - [tag]        — Category shown as `[TAG › Head]` in DevTools. Default `'LOG'`.
/// - [statusCode] — Optional HTTP status code shown next to the header.
/// - [error]      — Set `true` to route this entry as an error in DevTools.
///
/// ## Usage
/// ```dart
/// // Simple message
/// printApiResponse('Session started', head: '[NFC]');
///
/// // With a Map / List — pretty-printed as JSON
/// printApiResponse(response.data, head: 'getUserProfile', statusCode: 200);
///
/// // Error path
/// printApiResponse('Write failed', head: '[NFC ERROR]', error: true);
/// ```
///
/// ## Output example (in the run console)
/// ```
/// [NFC › getUserProfile] (200)
///   {
///     "id": 1,
///     "name": "Alice"
///   }
/// ```
void printLogs(
  Object? object, {
  String head = 'Log',
  String tag = 'LOG',
  int? statusCode,
  bool error = false,
}) {
  // Silent in release builds — no performance cost in production.
  if (!kDebugMode) return;

  // ── Format the body ──────────────────────────────────────────────────────
  final body = _formatBody(object);

  // ── Build a compact header line ──────────────────────────────────────────
  // Example: "(200)" or "" when no status code is provided.
  final status = statusCode != null ? ' ($statusCode)' : '';
  final header = '[$tag › $head]$status';

  // ── Single call to developer.log ─────────────────────────────────────────
  // This appears in DevTools Logging with the correct name, level, and time.
  // Passing [error] as the error object highlights it red in DevTools.
  developer.log(
    '$header\n$body',
    name: '$tag › $head',
    time: DateTime.now(),
    error: error ? (object ?? 'error') : null,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Private helpers
// ─────────────────────────────────────────────────────────────────────────────

/// Converts [object] to a readable string.
///
/// - Maps and Lists are pretty-printed as indented JSON.
/// - Strings longer than 800 chars are truncated to avoid console flooding.
/// - Any other type falls back to `.toString()`.
String _formatBody(Object? object) {
  if (object == null) return '  (null)';

  try {
    if (object is Map || object is List) {
      const encoder = JsonEncoder.withIndent('  ');
      // Indent every line so the JSON sits under the header cleanly.
      return encoder
          .convert(object)
          .split('\n')
          .map((line) => '  $line')
          .join('\n');
    }

    final raw = object.toString();

    // Truncate very long strings — avoids flooding logcat.
    if (raw.length > 800) {
      return '  ${raw.substring(0, 800)}\n'
          '  … (${raw.length - 800} more chars)';
    }

    return '  $raw';
  } catch (_) {
    return '  (unable to format — type: ${object.runtimeType})';
  }
}
