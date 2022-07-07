import 'package:bidder/presentation/pages/pay_with_momo/bloc/payment_bloc.dart';
import 'package:bidder/presentation/pages/pay_with_momo/pay_with_momo_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PayWithMomoPage extends StatelessWidget {
  const PayWithMomoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Payment Failure')),
              );
          }

          if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successfully Payment'),
                ),
              );
          }
        },
        child: const PayWithMomoPageLayout(),
      ),
    );
  }
}
