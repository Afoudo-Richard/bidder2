import 'package:formz/formz.dart';

enum PriceValidationError { empty,isNotAnInteger }

class Price extends FormzInput<String, PriceValidationError> {
  const Price.pure() : super.pure('');
  const Price.dirty([String value = '']) : super.dirty(value);

  @override
  PriceValidationError? validator(String? value) {
    if(value?.isNotEmpty == true){
      if(int.parse(value!) is int){
        return null;
      }
      else{
        return PriceValidationError.isNotAnInteger;
      }
    }else{
      return PriceValidationError.empty;
    }
    //return value?.isNotEmpty == true ? null : PriceValidationError.empty;
  }
}