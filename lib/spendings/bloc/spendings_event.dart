part of 'spendings_bloc.dart';

@immutable
sealed class SpendingsEvent {
  const SpendingsEvent();
}

final class AddSpendingEvent extends SpendingsEvent {
  const AddSpendingEvent();
}

final class SpendingNameChanged extends SpendingsEvent {
  const SpendingNameChanged({required this.name});
  final String name;
}

final class SpendingValueChanged extends SpendingsEvent {
  const SpendingValueChanged({required this.value});
  final int value;
}
