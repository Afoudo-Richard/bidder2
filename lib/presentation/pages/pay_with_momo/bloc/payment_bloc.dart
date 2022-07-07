import 'package:bidder/data/data_provider/campay_api.dart';
import 'package:bidder/data/model/forms/price.dart';
import 'package:bidder/data/model/models.dart';
import 'package:bidder/data/repository/campay_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentSubmit>(_onSubmitted);
    on<PhoneChanged>(_onPhoneChanged);
  }

  void _onPhoneChanged(
    PhoneChanged event,
    Emitter<PaymentState> emit,
  ) {
    final phone = Phone.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([phone]),
    ));
  }

  void _onSubmitted(
    PaymentSubmit event,
    Emitter<PaymentState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final response = CamPayRepository(camPayApi: CamPayApi())
          ..collectFund(phone: state.phone.value, amount: event.amount);

        print("printing the data here");
        print(response);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
