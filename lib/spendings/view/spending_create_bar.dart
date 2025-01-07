import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/spendings/models/spending_date.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/spendings_bloc.dart';

class SpendingCreateBar extends StatelessWidget {
  const SpendingCreateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpendingsBloc, SpendingsState>(
      builder: (context, state) {
        return Container(
          color: Colors.blue,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
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
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SpendingsBloc bloc) => bloc.state.name.displayError,
    );

    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_nameInput_textField'),
        onChanged: (name) {
          context.read<SpendingsBloc>().add(SpendingNameChanged(name: name));
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.label_name,
          errorText: displayError != null
              ? AppLocalizations.of(context)!.error_empty_name
              : null,
        ),
      ),
    );
  }
}

class _ValueInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SpendingsBloc bloc) => bloc.state.value.displayError,
    );
    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_valueInput_textField'),
        onChanged: (value) {
          context.read<SpendingsBloc>().add(SpendingValueChanged(value: value));
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.label_value,
          errorText: displayError != null
              ? AppLocalizations.of(context)!.error_empty_value
              : null,
        ),
      ),
    );
  }
}

class _DateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SpendingsBloc bloc) => bloc.state.date.displayError,
    );

    String? errorText;
    if (displayError != null) {
      if (displayError == DateValidationError.empty) {
        errorText = AppLocalizations.of(context)!.error_empty_date;
      } else if (displayError == DateValidationError.format) {
        errorText = AppLocalizations.of(context)!.error_invalide_date_format;
      }
    }

    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('spendingForm_dateInput_textField'),
        onChanged: (date) {
          context.read<SpendingsBloc>().add(SpendingDateChanged(date: date));
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.label_date,
          errorText: errorText,
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
