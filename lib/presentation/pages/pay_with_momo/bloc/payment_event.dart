part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PhoneChanged extends PaymentEvent {
  const PhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PaymentSubmit extends PaymentEvent {
  const PaymentSubmit(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}
