import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/spendings_bloc.dart';

class SpendingCreateBar extends StatelessWidget {
  const SpendingCreateBar({super.key});

//TODO wrapper cela dans un BlocConstructor et faire que l'information affiché dans les textbox soit géré par le Cubit.
//TODO voir comment cela se gère avec le textEditController
  @override
  Widget build(BuildContext context) {
    return BlocListener<SpendingsBloc, SpendingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Container(
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              _DateInput(),
              _ValueInput(),
              _NameInput(),
              _AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );*/

    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_nameInput_textField'),
        onChanged: (name) {
          context.read<SpendingsBloc>().add(SpendingNameChanged(name: name));
        },
        decoration: const InputDecoration(
          labelText: 'username',
          errorText: 'Error',
        ),
      ),
    );
  }
}

class _ValueInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_valueInput_textField'),
        onChanged: (value) {
          context.read<SpendingsBloc>().add(SpendingValueChanged(value: value));
        },
        decoration: const InputDecoration(
          labelText: 'value',
          errorText: 'Error',
        ),
      ),
    );
  }
  /*final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );*/
}

class _DateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_dateInput_textField'),
        onChanged: (date) {
          context.read<SpendingsBloc>().add(SpendingDateChanged(date: date));
        },
        decoration: const InputDecoration(
          labelText: 'date',
          errorText: 'Error',
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: OutlinedButton(
        onPressed: () =>
            context.read<SpendingsBloc>().add(const AddSpendingEvent()),
        clipBehavior: Clip.antiAlias,
        child: const Icon(Icons.add),
      ),
    );
  }
}
