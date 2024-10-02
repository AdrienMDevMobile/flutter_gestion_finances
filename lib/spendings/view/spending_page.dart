import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/view/cubit/spending_cubit.dart';
import 'package:flutter_gestion_finances/spendings/view/spending_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class SpendingPage extends StatelessWidget {
  /// {@macro counter_page}
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpendingCubit(),
      child: const SpendingView(),
    );
  }
}
