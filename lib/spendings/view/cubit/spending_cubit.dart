//La classe observée
import 'package:bloc/bloc.dart';

class SpendingCubit extends Cubit<List<int>> {
  SpendingCubit() : super(List.empty(growable: true));

  /// Add the spending to the current state.
  void add(int Spending) {
    state.add(1);
    emit(state);
  }

  /// Subtract 1 from the current state.
  //void decrement() => emit(state - 1);
}
