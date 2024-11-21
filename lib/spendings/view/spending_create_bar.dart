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
        height: 100,
        color: Colors.blue,
        child: Row(
          children: [
            const SizedBox(width: 8),
            _DateInput(),
            const SizedBox(width: 8),
            _ValueInput(),
            const SizedBox(width: 8),
            _NameInput(),
            //TODO variables de traduction
            const SizedBox(width: 8),
            _AddButton(),
            const SizedBox(height: 8),
          ],
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

    return Flexible(
        flex: 6,
        child: TextField(
          key: const Key('spendingForm_nameInput_textField'),
          onChanged: (name) {
            context.read<SpendingsBloc>().add(SpendingNameChanged(name: name));
          },
          decoration: const InputDecoration(
            labelText: 'username',
            errorText: 'Error',
          ),
        ));
  }
}

class _ValueInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 6,
        child: TextField(
          key: const Key('spendingForm_valueInput_textField'),
          onChanged: (value) {
            context
                .read<SpendingsBloc>()
                .add(SpendingValueChanged(value: value));
          },
          decoration: const InputDecoration(
            labelText: 'value',
            errorText: 'Error',
          ),
        ));
  }
  /*final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );*/
}

class _DateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 6,
        fit: FlexFit.tight,
        child: TextField(
          //TODO comprendre
          key: const Key('spendingForm_dateInput_textField'),
          onChanged: (value) {
            context.read<SpendingsBloc>().add(SpendingDateChanged(date: value));
          },
          decoration: const InputDecoration(
            labelText: 'date',
            errorText: 'Error',
          ),
        ));
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: OutlinedButton(
          onPressed: () =>
              context.read<SpendingsBloc>().add(const AddSpendingEvent()),
          child: const Icon(Icons.add),
        ));
  }
}
