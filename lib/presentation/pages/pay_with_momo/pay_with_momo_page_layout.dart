import 'package:bidder/presentation/pages/login_page/bloc/login_bloc.dart';
import 'package:bidder/presentation/pages/pay_with_momo/bloc/payment_bloc.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PayWithMomoPageLayout extends StatelessWidget {
  const PayWithMomoPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Payment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: pagePadding,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        return CustomInput(
                          key: const Key('paymentForm_PhoneInput_textField'),
                          inputHintText: "Enter phone number",
                          leading: const Icon(
                            Icons.person,
                            size: 30,
                            color: primaryColor,
                          ),
                          onChanged: (phone) =>
                              BlocProvider.of<PaymentBloc>(context)
                                  .add(PhoneChanged(phone)),
                          inputErrorText: state.phone.invalid
                              ? 'invalid phone number'
                              : null,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<PaymentBloc, PaymentState>(
                        builder: (context, state) {
                          return CustomButton(
                            backgroundColor: secondaryColor,
                            onPressed: state.status.isValidated
                                ? () {
                                    context
                                        .read<PaymentBloc>()
                                        .add(PaymentSubmit('100'));
                                  }
                                : null,
                            child: state.status.isSubmissionInProgress
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Make Payment",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: const CustomButtomNavigationBar(),
    );
  }
}
