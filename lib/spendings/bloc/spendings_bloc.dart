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
    final newState = state.copyWith(
        spendings: List.from(state.spendings, growable: true).cast<Spending>()
          ..add(Spending(
              value: int.parse(state.value.value), name: state.name.value)));
    print(
        'micheldr _onAddSpending ${newState.value.value} ${newState.name.value}');
    emit(newState);
  }

  void _onSpendingNameChanged(
      SpendingNameChanged event, Emitter<SpendingsState> emit) {
    print('micheldr _onSpendingNameChanged ${event.name}');
    final name = Name.dirty(event.name);
    final newState = state.copyWith(name: name);
    print(
        'micheldr _onSpendingNameChanged ${newState.value.value} ${newState.name.value}');
    emit(newState);
  }

  void _onSpendingValueChanged(
      SpendingValueChanged event, Emitter<SpendingsState> emit) {
    final value = Value.dirty(event.value);
    final newState = state.copyWith(value: value);
    emit(newState);
  }
}
