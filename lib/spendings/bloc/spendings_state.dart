part of 'spendings_bloc.dart';

@immutable
final class SpendingsState extends Equatable {
  const SpendingsState(
      {this.spendings = const [],
      this.name = const Name.pure(),
      this.value = const Value.pure(),
      this.date = const Date.pure()});

  final List<Spending> spendings;
  final Name name;
  final Value value;
  final Date date;

  @override
  List<Object> get props => [spendings, name, value, date];

  SpendingsState copyWith({
    List<Spending>? spendings,
    Name? name,
    Value? value,
    Date? date,
  }) {
    return SpendingsState(
      spendings: spendings ?? this.spendings,
      name: name ?? this.name,
      value: value ?? this.value,
      date: date ?? this.date,
    );
  }
}
