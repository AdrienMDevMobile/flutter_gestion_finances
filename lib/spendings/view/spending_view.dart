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
            child: const Row(
              children: [
                Flexible(
                    flex: 1,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Spending',
                    )))
                /*
                )*/
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[Ò
          //EditableTextÒ(controller: controller, focusNode: focusNode, style: style, cursorColor: cursorColor, backgroundCursorColor: backgroundCursorColor)
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<SpendingCubit>().add(1),
          ),
        ],
      ),
    );
  }
}
