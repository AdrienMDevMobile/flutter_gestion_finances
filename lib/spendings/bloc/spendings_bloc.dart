import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

part 'spendings_event.dart';
part 'spendings_state.dart';

class SpendingsBloc extends Bloc<SpendingsEvent, SpendingsState> {
  SpendingsBloc() : super(const SpendingsState()) {
    on<AddSpendingEvent>(_onAddSpending);
    on<SpendingNameChanged>(_onSpendingNameChanged);
    on<SpendingValueChanged>(_onSpendingValueChanged);
  }

  void _onAddSpending(AddSpendingEvent event, Emitter<SpendingsState> emit) {
    print('micheldr _onAddSpending ${state.value.value} ${state.name.value}');
    emit(state.copyWith(
        spendings: List.from(state.spendings, growable: true).cast<Spending>()
          ..add(Spending(value: state.value.value, name: state.name.value))));
  }

  void _onSpendingNameChanged(
      SpendingNameChanged event, Emitter<SpendingsState> emit) {
    print('micheldr _onSpendingNameChanged ${event.name}');
    final name = Name.dirty(event.name);
    print(
        'micheldr _onSpendingNameChanged 2 ${state.value.value} ${state.name.value}');
    emit(state.copyWith(name: name));
  }

  void _onSpendingValueChanged(
      SpendingValueChanged event, Emitter<SpendingsState> emit) {
    print('micheldr _onSpendingValueChanged ${event.value}');
    final value = Value.dirty(event.value);
    print(
        'micheldr _onSpendingValueChanged 2 ${state.value.value} ${state.name.value}');
    emit(state.copyWith(value: value));
  }
}
