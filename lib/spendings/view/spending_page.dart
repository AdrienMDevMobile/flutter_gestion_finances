import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/view/cubit/spendings_cubit.dart';
import 'package:flutter_gestion_finances/spendings/view/spending_view.dart';

import 'cubit/spending_input_cubit.dart';

class SpendingPage extends StatelessWidget {
  /// {@macro counter_page}
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpendingsCubit>(
          create: (context) => SpendingsCubit(),
        ),
        BlocProvider<SpendingInputCubit>(
          create: (context) => SpendingInputCubit(),
        ),
      ],
      child: const SpendingView(),
    );
  }
}
