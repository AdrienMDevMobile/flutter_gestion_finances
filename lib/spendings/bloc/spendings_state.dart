part of 'spendings_bloc.dart';

@immutable
final class SpendingsState extends Equatable {
  const SpendingsState(
      {this.spendings = const [],
      this.name = const Name.pure(),
      this.value = const Value.pure()});

  final List<Spending> spendings;
  final Name name;
  final Value value;

  @override
  List<Object> get props => [spendings, name, value];

  SpendingsState copyWith({
    List<Spending>? spendings,
    Name? name,
    Value? value,
  }) {
    print('micheldr a ${this.spendings} $spendings');
    print('micheldr b ${this.name} $name');
    print('micheldr c ${this.value} $value');

    return SpendingsState(
      spendings: spendings ?? this.spendings,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}
