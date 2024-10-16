import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/spending_cubit.dart';

class SpendingCreateBar extends StatelessWidget {
  const SpendingCreateBar({super.key});

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
              ))),
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
                onPressed: () => context.read<SpendingCubit>().add(1, "test"),
                child: const Icon(Icons.add),
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
