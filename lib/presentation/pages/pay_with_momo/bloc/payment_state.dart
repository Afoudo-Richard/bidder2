part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.status = FormzStatus.pure,
    this.phone = const Phone.pure(),
  });

  final FormzStatus status;
  final Phone phone;

  PaymentState copyWith({
    FormzStatus? status,
    Phone? phone,
  }) {
    return PaymentState(
      status: status ?? this.status,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [status, phone];
}
