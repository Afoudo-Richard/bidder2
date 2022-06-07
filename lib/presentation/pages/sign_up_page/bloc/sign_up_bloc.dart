import 'package:bidder/data/model/models.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required this.bidderRepository,
  }) : super(const SignUpState()) {
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPhoneChanged>(_onPhoneChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  final BidderRepository bidderRepository;

  void _onFirstNameChanged(
    SignUpFirstNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final firstName = FirstName.dirty(event.firstname);
    emit(state.copyWith(
      firstName: firstName,
      status: Formz.validate([
        firstName,
        state.lastName,
        state.email,
        state.phone,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onLastNameChanged(
    SignUpLastNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final lastName = LastName.dirty(event.lastname);
    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate([
        state.firstName,
        lastName,
        state.email,
        state.phone,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        email,
        state.phone,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onPhoneChanged(
    SignUpPhoneChanged event,
    Emitter<SignUpState> emit,
  ) {
    final phone = Phone.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.email,
        phone,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.email,
        state.phone,
        password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final confirmPassword = ConfirmPassword.dirty(event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.email,
        state.phone,
        state.password,
        confirmPassword,
      ]),
    ));
  }

  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final signUpResponse = await bidderRepository.signUp(
          firstname: state.firstName.value,
          lastname: state.lastName.value,
          email: state.email.value,
          phone: state.phone.value,
          password: state.password.value,
        );

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
