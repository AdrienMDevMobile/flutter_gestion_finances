import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/spendings_bloc.dart';

class SpendingsList extends StatelessWidget {
  const SpendingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: BlocBuilder<SpendingsBloc, SpendingsState>(
        builder: (context, state) {
          return state.spendings.isEmpty
              ? const Center(child: Text('Empty'))
              : ListView.builder(
                  itemCount: state.spendings.length,
                  itemBuilder: (_, index) => Text(
                      '${state.spendings[index].name} ${state.spendings[index].value}',
                      style: textTheme.displayMedium));
        },
      ),
    );
  }
}
