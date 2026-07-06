import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Prints a formatted API response to the debug console.
///
/// - [object]    : The response body / data to inspect (Map, List, String, etc.)
/// - [head]      : A label to identify the log source (e.g., function name or API tag)
/// - [statusCode]: Optional HTTP status code (200, 404, 500, etc.)
/// - [tag]       : Optional grouping tag for filtering logs (defaults to 'API')
/// - [error]     : Set to true to highlight this entry as an error
///
/// Example:
/// ```dart
/// printApiResponse(
///   response.data,
///   head: 'getUserProfile',
///   statusCode: response.statusCode,
/// );
/// ```
void printLogs(
  Object? object, {
  String? head = "Head",
  int? statusCode,
  String tag = 'API',
  bool error = false,
}) {
  if (!kDebugMode) return;

  // ── ANSI color codes ──────────────────────────────────────────
  const reset = '\x1B[0m';
  const bold = '\x1B[1m';
  const green = '\x1B[32m';
  const cyan = '\x1B[36m';
  const yellow = '\x1B[33m';
  const red = '\x1B[31m';
  const magenta = '\x1B[35m';
  const white = '\x1B[97m';
  const dimGray = '\x1B[90m';

  // ── Helpers ───────────────────────────────────────────────────
  final now = DateTime.now();
  final timestamp =
      '${now.hour.toString().padLeft(2, '0')}:'
      '${now.minute.toString().padLeft(2, '0')}:'
      '${now.second.toString().padLeft(2, '0')}.'
      '${now.millisecond.toString().padLeft(3, '0')}';

  final typeLabel = object == null ? 'null' : object.runtimeType.toString();

  final statusLabel = statusCode != null
      ? _statusBadge(statusCode, green, yellow, red, reset)
      : '';

  final bodyColor = error ? red : green;
  final headerColor = error ? red : cyan;

  const divider = '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━';

  // ── Formatted body ────────────────────────────────────────────
  final formattedBody = _formatBody(object);

  // ── Assemble log lines ────────────────────────────────────────
  final buffer = StringBuffer()
    ..writeln('$dimGray$divider$reset')
    ..writeln(
      '$bold$headerColor▶  $head$reset  '
      '$dimGray[$tag]$reset  '
      '$white$timestamp$reset'
      '${statusLabel.isNotEmpty ? '  $statusLabel' : ''}',
    )
    ..writeln('$dimGray  type    →$reset $magenta$typeLabel$reset')
    ..writeln('$dimGray  payload →$reset\n$bodyColor$formattedBody$reset')
    ..write('$dimGray$divider$reset');

  // printLogs chunks long strings safely (avoids logcat truncation).
  printLogs(buffer.toString());

  // Also route to dart:developer so it shows up in DevTools logs.
  developer.log(
    formattedBody,
    name: '$tag › $head',
    time: now,
    error: error ? object : null,
  );
}

// ── Private helpers ───────────────────────────────────────────────────────────

/// Returns a colored HTTP status badge string.
String _statusBadge(
  int code,
  String green,
  String yellow,
  String red,
  String reset,
) {
  final color = code >= 200 && code < 300
      ? green
      : code >= 400 && code < 500
      ? yellow
      : red;
  return '$color[$code]$reset';
}

/// Pretty-prints [object] — handles Map/List with indentation,
/// long strings, and falls back gracefully for any other type.
String _formatBody(Object? object) {
  if (object == null) return '  (null)';

  try {
    if (object is Map || object is List) {
      // Indent each line of the JSON-like structure for readability.
      const encoder = JsonEncoder.withIndent('  ');
      return encoder
          .convert(object)
          .split('\n')
          .map((line) => '  $line')
          .join('\n');
    }

    final raw = object.toString();
    if (raw.length > 800) {
      // Avoid flooding the console for huge blobs.
      return '  ${raw.substring(0, 800)}\n  … (${raw.length - 800} chars truncated)';
    }
    return '  $raw';
  } catch (_) {
    return '  (unable to format: ${object.runtimeType})';
  }
}
