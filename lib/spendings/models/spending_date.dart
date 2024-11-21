import 'package:formz/formz.dart';

enum DateValidationError { empty }

class Date extends FormzInput<String, DateValidationError> {
  const Date.pure() : super.pure('');
  const Date.dirty([super.value = '']) : super.dirty();

//TODO : format de la string
  @override
  DateValidationError? validator(String value) {
    if (value.isEmpty) return DateValidationError.empty;
    return null;
  }
}
