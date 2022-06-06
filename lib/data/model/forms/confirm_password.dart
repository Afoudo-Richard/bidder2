import 'package:bidder/presentation/pages/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:bidder/data/model/forms/password.dart';

enum ConfirmPasswordValidationError { empty, notEqualToPassword }

class ConfirmPassword extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure() : super.pure('');
  const ConfirmPassword.dirty([String value = '']) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    // if(value?.isNotEmpty == true){
    
    //  print(BlocProvider.of<SignUpBloc>(context).state.password.value);
    //   return value == Password.dirty().value ? null : ConfirmPasswordValidationError.notEqualToPassword;
    // }else{
    //   return ConfirmPasswordValidationError.empty;
    // }
    return value?.isNotEmpty == true ? null : ConfirmPasswordValidationError.empty;
  }
}