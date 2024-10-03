//La classe observée
import 'package:bloc/bloc.dart';
import 'package:flutter_gestion_finances/spendings/view/spending_view_state.dart';

class SpendingCubit extends Cubit<SpendingViewState> {
  SpendingCubit()
      : super(SpendingViewState(spendings: List.empty(growable: true)));

  /// Add the spending to the current state.
  void add(int Spending) {
    emit(SpendingViewState(
        spendings: List.from(state.spendings, growable: true).cast<int>()
          ..add(Spending)));
  }

  /// Subtract 1 from the current state.
  //void decrement() => emit(state - 1);
}
