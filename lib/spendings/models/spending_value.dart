import 'package:formz/formz.dart';

enum ValueValidationError { empty }

class Value extends FormzInput<String, ValueValidationError> {
  const Value.pure() : super.pure('');
  const Value.dirty([super.value = '']) : super.dirty();

  @override
  ValueValidationError? validator(String value) {
    if (value.isEmpty) return ValueValidationError.empty;
    return null;
  }
}
