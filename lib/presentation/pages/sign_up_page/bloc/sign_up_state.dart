part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzStatus.pure,
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.confirmPassword = const ConfirmPassword.pure()
  });

  final FormzStatus status;
  final FirstName firstName;
  final LastName lastName;
  final Email email;
  final Phone phone;
  final Password password;
  final ConfirmPassword confirmPassword;

  SignUpState copyWith({
    FormzStatus? status,
    FirstName? firstName,
    LastName? lastName,
    Email? email,
    Phone? phone,
    Password? password,
    ConfirmPassword? confirmPassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword:  confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object> get props => [status,firstName, lastName, email, phone, password, confirmPassword];
}
