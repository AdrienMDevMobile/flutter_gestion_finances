import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/spendings_bloc.dart';

class SpendingCreateBar extends StatelessWidget {
  const SpendingCreateBar({super.key});

//TODO wrapper cela dans un BlocConstructor et faire que l'information affiché dans les textbox soit géré par le Cubit.
//TODO voir comment cela se gère avec le textEditController
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Flexible(
              flex: 6,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Spending',
                ),
              )),
          const SizedBox(width: 8),
          const Flexible(
              flex: 6,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Value',
                ),
                keyboardType: TextInputType.number,
              )),
          //TODO variables de traduction
          const SizedBox(width: 8),
          Flexible(
              flex: 1,
              child: OutlinedButton(
                onPressed: () => context
                    .read<SpendingsBloc>()
                    .add(const AddSpendingEvent(value: 1, name: "test")),
                child: const Icon(Icons.add),
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
