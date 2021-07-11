import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite/app.dart';
import 'package:riverpod_infinite/logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: App(),
    ),
  );
}
