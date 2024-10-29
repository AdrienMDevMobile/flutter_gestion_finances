import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/spendings_bloc.dart';
import 'spending_view.dart';

class SpendingPage extends StatelessWidget {
  /// {@macro counter_page}
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpendingsBloc(),
      child: const SpendingView(),
    );
  }
}
