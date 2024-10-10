import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/spendings.dart';

import 'cubit/spending_view_state.dart';

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
            child: BlocBuilder<SpendingCubit, SpendingViewState>(
              builder: (context, state) {
                return state.spendings.isEmpty
                    ? Center(child: Text('Empty'))
                    : ListView.builder(
                        itemCount: state.spendings.length,
                        itemBuilder: (_, index) => Text(
                            '${state.spendings[index]}',
                            style: textTheme.displayMedium));
              },
            ),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Flexible(
                    flex: 10,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Spending',
                    ))),
                const SizedBox(width: 8),
                Flexible(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () => context.read<SpendingCubit>().add(1),
                      child: const Icon(Icons.add),
                    )),
                const SizedBox(height: 8),
                /*
                )*/
              ],
            ),
          )
        ]),
      ),
    );
  }
}
