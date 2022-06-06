import 'package:formz/formz.dart';

enum CategoryValidationError { empty }

class Category extends FormzInput<String, CategoryValidationError> {
  const Category.pure() : super.pure('');
  const Category.dirty([String value = '']) : super.dirty(value);

  @override
  CategoryValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : CategoryValidationError.empty;
  }
}