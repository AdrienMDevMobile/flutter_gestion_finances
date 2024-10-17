import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/view/cubit/spending_input_cubit.dart';
import 'package:flutter_gestion_finances/spendings/view/cubit/spending_input_view_state.dart';

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
          Flexible(
              flex: 6,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Spending',
                ),
                onChanged: (value) =>
                    context.read<SpendingInputCubit>().onNameChanged(value),
              )),
          const SizedBox(width: 8),
          Flexible(
              flex: 6,
              child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Value',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => context
                      .read<SpendingInputCubit>()
                      .onValueChanged(int.parse(value)))),
          //TODO variables de traduction
          const SizedBox(width: 8),
          Flexible(
              flex: 1,
              child: OutlinedButton(
                onPressed: () =>
                    context.read<SpendingInputCubit>().add(1, "test"),
                child: const Icon(Icons.add),
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
