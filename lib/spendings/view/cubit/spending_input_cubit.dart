//La classe observée
import 'package:bloc/bloc.dart';

import '../../domain/spending.dart';
import 'spending_input_view_state.dart';
import 'spendings_view_state.dart';

class SpendingInputCubit extends Cubit<SpendingInputViewState> {
  SpendingInputCubit() : super(SpendingInputViewState(name: "", value: 0));

  /// Add the spending to the current state.
  void add(int value, String name) {}

  void onNameChanged(String newName) {
    emit(SpendingInputViewState(name: newName, value: state.value));
  }

  void onValueChanged(int newValue) {
    emit(SpendingInputViewState(name: state.name, value: newValue));
  }

  /// Subtract 1 from the current state.
  //void decrement() => emit(state - 1);
}
