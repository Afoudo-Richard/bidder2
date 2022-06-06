import 'package:bidder/presentation/pages/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpPageLayout extends StatelessWidget {
  const SignUpPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: pagePadding,
            height: MediaQuery.of(context).size.height + 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  "Bidder",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      key: const Key('SignUpForm_FirstNameInput_textField'),
                      inputHintText: "Firstname",
                      leading: const Icon(
                        Icons.person,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (firstname) =>
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpFirstNameChanged(firstname)),
                      inputErrorText:
                          state.firstName.invalid ? 'invalid FirstName' : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      key: const Key('SignUpForm_LastNameInput_textField'),
                      inputHintText: "Lastname",
                      leading: const Icon(
                        Icons.person,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (lastname) =>
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpLastNameChanged(lastname)),
                      inputErrorText:
                          state.lastName.invalid ? 'invalid LastName' : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      key: const Key('SignUpForm_EmailInput_textField'),
                      inputHintText: "Email",
                      leading: const Icon(
                        Icons.email,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (email) => BlocProvider.of<SignUpBloc>(context)
                          .add(SignUpEmailChanged(email)),
                      inputErrorText:
                          state.email.invalid ? 'invalid Email' : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      key: const Key('SignUpForm_PhoneInput_textField'),
                      inputHintText: "Phone",
                      leading: const Icon(
                        Icons.phone,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (phone) => BlocProvider.of<SignUpBloc>(context)
                          .add(SignUpPhoneChanged(phone)),
                      inputErrorText:
                          state.phone.invalid ? 'invalid Phone' : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      allowMultiline: false,
                      key: const Key('SignUpForm_PasswordInput_textField'),
                      inputObscureText: true,
                      inputHintText: "Password",
                      leading: const Icon(
                        Icons.lock,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (password) =>
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpPasswordChanged(password)),
                      inputErrorText:
                          state.password.invalid ? 'invalid Password' : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomInput(
                      allowMultiline: false,
                      key: const Key(
                          'SignUpForm_ConfirmPasswordInput_textField'),
                      inputHintText: "Confirm Password",
                      inputObscureText: true,
                      leading: const Icon(
                        Icons.lock,
                        size: 30,
                        color: primaryColor,
                      ),
                      onChanged: (confirmPassword) =>
                          BlocProvider.of<SignUpBloc>(context).add(
                              SignUpConfirmPasswordChanged(confirmPassword)),
                      inputErrorText: state.confirmPassword.invalid
                          ? 'invalid Confirm Password'
                          : null,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return CustomButton(
                        backgroundColor: secondaryColor,
                        onPressed: state.status.isValidated
                            ? () {
                                context
                                    .read<SignUpBloc>()
                                    .add(const SignUpSubmitted());
                              }
                            : null,
                        child: state.status.isSubmissionInProgress
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Sign Up",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  backgroundColor: secondaryColor,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Skip",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: primaryColor,
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
      ),
    );
  }
}
