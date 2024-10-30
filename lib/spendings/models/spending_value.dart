import 'package:formz/formz.dart';

enum ValueValidationError { empty }

class Value extends FormzInput<int, ValueValidationError> {
  const Value.pure() : super.pure(0);
  const Value.dirty([super.value = 0]) : super.dirty();

  @override
  ValueValidationError? validator(int value) {
    if (value == 0) return ValueValidationError.empty;
    return null;
  }
}
