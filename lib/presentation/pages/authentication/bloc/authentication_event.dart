part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged({
    required this.authenticated,
    this.user,
  });

  final bool authenticated;
  final User? user;

  @override
  List<Object> get props => [authenticated];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationChecked extends AuthenticationEvent {
  const AuthenticationChecked({
    required this.value,
  });
  final bool value;
}
