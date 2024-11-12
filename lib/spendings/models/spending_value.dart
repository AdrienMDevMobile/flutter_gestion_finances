import 'package:formz/formz.dart';

enum ValueValidationError { empty, nonNumeric }

class Value extends FormzInput<String, ValueValidationError> {
  const Value.pure() : super.pure('');
  const Value.dirty([super.value = '']) : super.dirty();

  @override
  ValueValidationError? validator(String value) {
    if (value == '') return ValueValidationError.empty;
    if (int.tryParse(value) == null) return ValueValidationError.nonNumeric;
    return null;
  }
}
