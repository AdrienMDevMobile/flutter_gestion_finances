import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestion_finances/spendings/models/translater_ext.dart';
import 'package:spendings_repository/spendings_repository.dart' as srepo;
import '../models/models.dart';
import '../models/spending_date.dart';

part 'spendings_event.dart';
part 'spendings_state.dart';

class SpendingsBloc extends Bloc<SpendingsEvent, SpendingsState> {
  SpendingsBloc({
    required srepo.SpendingsRepository repository,
  })  : _repository = repository,
        super(const SpendingsState()) {
    on<SpendingsSubscriptionRequested>(_onSpendingSubscriptionRequested);
    on<AddSpendingEvent>(_onAddSpending);
    on<SpendingNameChanged>(_onSpendingNameChanged);
    on<SpendingValueChanged>(_onSpendingValueChanged);
    on<SpendingDateChanged>(_onSpendingDateChanged);
  }

  final srepo.SpendingsRepository _repository;

  Future<void> _onSpendingSubscriptionRequested(
      SpendingsSubscriptionRequested event,
      Emitter<SpendingsState> emit) async {
    await emit.forEach(_repository.getSpendings(),
        onData: (spendings) => _onSpendingsData(spendings));
  }

  SpendingsState _onSpendingsData(List<srepo.Spending> spendings) {
    print("micheldr onData ${spendings.length}");
    return state.copyWith(
        spendings: spendings.map((spending) => toView(spending)).toList());
  }

  void _onAddSpending(AddSpendingEvent event, Emitter<SpendingsState> emit) {
    print("micheldr saving data");
    _repository.saveSpending(toData(
        Spending(value: int.parse(state.value.value), name: state.name.value)));
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

  void _onSpendingDateChanged(
      SpendingDateChanged event, Emitter<SpendingsState> emit) {
    final date = Date.dirty(event.date);
    final newState = state.copyWith(date: date);
    emit(newState);
  }
}
