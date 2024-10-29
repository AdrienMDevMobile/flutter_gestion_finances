part of 'spendings_bloc.dart';

@immutable
sealed class SpendingsState extends Equatable {
  const SpendingsState(this.spendings);

  final List<Spending> spendings;

  @override
  List<Object> get props => [spendings];
}

final class SpendingsInitial extends SpendingsState {
  const SpendingsInitial(super.spendings);

  @override
  String toString() => spendings.toString();
}
