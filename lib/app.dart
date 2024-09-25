import 'package:flutter/material.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class SpendingApp extends MaterialApp {
  /// {@macro counter_app}
  const SpendingApp({super.key}) : super(home: const SpendingPage());
}
