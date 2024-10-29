part of 'spendings_bloc.dart';

@immutable
sealed class SpendingsEvent {
  const SpendingsEvent();
}

final class AddSpendingEvent extends SpendingsEvent {
  const AddSpendingEvent({required this.value, required this.name});
  final int value;
  final String name;
}
