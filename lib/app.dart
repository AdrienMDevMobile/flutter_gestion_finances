import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'spendings/spendings.dart';
import 'package:spendings_repository/spendings_repository.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [SpendingPage].
/// {@endtemplate}

class SpendingApp extends StatelessWidget {
  /// {@macro counter_app}
  const SpendingApp({required this.spendingsRepository, super.key});

  final SpendingsRepository spendingsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: spendingsRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SpendingPage(),
    );
  }
}
