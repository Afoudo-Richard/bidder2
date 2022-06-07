import 'dart:convert';

import 'package:bidder/data/model/backend/user.dart';
import 'package:bidder/data/model/models.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.bidderRepository,
    required this.authenticationBloc,
  }) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final BidderRepository bidderRepository;
  final AuthenticationBloc authenticationBloc;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        ParseUser loginResponse = await bidderRepository.login(
          email: state.email.value,
          password: state.password.value,
        ) as ParseUser;

        final userModel = {
          'id': loginResponse.objectId,
          'firstname': loginResponse.get('firstname'),
          'lastname': loginResponse.get('lastname'),
          'email': loginResponse.emailAddress,
          'phone': loginResponse.get('phone'),
          'dateCreated': loginResponse.createdAt
        };

        print(jsonEncode(userModel));

        authenticationBloc.add(AuthenticationStatusChanged(
          authenticated: true,
          user: User.fromJson(json.encode(userModel.toString())),
        ));
        print(loginResponse);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
