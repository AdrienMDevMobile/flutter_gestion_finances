//La classe observée
import 'package:bloc/bloc.dart';

import '../../data/spending.dart';
import 'spending_view_state.dart';

class SpendingCubit extends Cubit<SpendingViewState> {
  SpendingCubit()
      : super(SpendingViewState(spendings: List.empty(growable: true)));

  /// Add the spending to the current state.
  void add(int value, String name) {
    emit(SpendingViewState(
        spendings: List.from(state.spendings, growable: true).cast<Spending>()
          ..add(Spending(value: value, name: name))));
  }

  /// Subtract 1 from the current state.
  //void decrement() => emit(state - 1);
}
