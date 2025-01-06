import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestion_finances/spendings/models/translater_ext.dart';
import 'package:spendings_api/spendings_api.dart'
    show SpendingTimeViewed, Spendings;
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
    on<TimeViewedChanged>(_onTimeViewedChanged);
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

  SpendingsState _onSpendingsData(Spendings spendings) {
    print(
        "micheldr onData ${spendings.spendings.length} ${spendings.timeViewed.month} ${spendings.timeViewed.year}");
    List<Spending> viewSpendings =
        spendings.spendings.map((spending) => toView(spending)).toList();
    return state.copyWith(
        spendings: viewSpendings,
        monthViewed: spendings.timeViewed.month,
        yearViewed: spendings.timeViewed.year,
        totalSpent: getTotalSpent(viewSpendings));
  }

  void _onTimeViewedChanged(
      TimeViewedChanged event, Emitter<SpendingsState> emit) {
    int newMonth = state.monthViewed;
    int newYear = state.yearViewed;

    newMonth = ((state.monthViewed - 1 + event.difference) % 12) + 1;
    newYear = state.yearViewed +
        ((state.monthViewed - 1 + event.difference) / 12).floor();

    _repository
        .changeTimeViewed(SpendingTimeViewed(month: newMonth, year: newYear));
  }

  void _onAddSpending(AddSpendingEvent event, Emitter<SpendingsState> emit) {
    _repository.saveSpending(toData(Spending(
        value: int.parse(state.value.value),
        name: state.name.value,
        date: DateTime.parse(state.date.value))));
  }

  void _onSpendingNameChanged(
      SpendingNameChanged event, Emitter<SpendingsState> emit) {
    final name = Name.dirty(event.name);
    final newState = state.copyWith(name: name);
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

  int getTotalSpent(List<Spending> spendings) {
    int toReturn = 0;
    spendings.forEach((spending) {
      toReturn += spending.value;
    });
    return toReturn;
  }
}
