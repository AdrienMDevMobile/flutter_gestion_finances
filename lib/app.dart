import 'package:flutter/material.dart';
import 'package:flutter_gestion_finances/spendings/view/spending_page.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [SpendingPage].
/// {@endtemplate}
class SpendingApp extends MaterialApp {
  /// {@macro counter_app}
  const SpendingApp({super.key}) : super(home: const SpendingPage());
}
