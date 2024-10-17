import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/spendings.dart';

import 'cubit/spendings_view_state.dart';
import 'spending_create_bar.dart';

class SpendingView extends StatelessWidget {
  /// {@macro counter_view}
  const SpendingView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: BlocBuilder<SpendingsCubit, SpendingsViewState>(
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
          ),
          const SpendingCreateBar()
        ]),
      ),
    );
  }
}
