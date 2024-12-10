part of 'spendings_bloc.dart';

@immutable
final class SpendingsState extends Equatable {
  const SpendingsState({
    this.spendings = const [],
    this.name = const Name.pure(),
    this.value = const Value.pure(),
    this.date = const Date.pure(),
    this.yearViewed = 0,
    this.monthViewed = 0,
    this.totalSpent = 0,
  });

  final List<Spending> spendings;
  final Name name;
  final Value value;
  final Date date;
  final int yearViewed;
  final int monthViewed;
  final int totalSpent;

  @override
  List<Object> get props =>
      [spendings, name, value, date, yearViewed, monthViewed];

  SpendingsState copyWith(
      {List<Spending>? spendings,
      Name? name,
      Value? value,
      Date? date,
      int? yearViewed,
      int? monthViewed,
      int? totalSpent}) {
    return SpendingsState(
        spendings: spendings ?? this.spendings,
        name: name ?? this.name,
        value: value ?? this.value,
        date: date ?? this.date,
        yearViewed: yearViewed ?? this.yearViewed,
        monthViewed: monthViewed ?? this.monthViewed,
        totalSpent: totalSpent ?? this.totalSpent);
  }
}
