import 'package:bidder/presentation/pages/login_page/bloc/login_bloc.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginPageLayout extends StatelessWidget {
  const LoginPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Center(
                        child: Text(
                          'Login In',
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
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return CustomInput(
                            key: const Key('loginForm_EmailInput_textField'),
                            inputHintText: "Email",
                            leading: const Icon(
                              Icons.person,
                              size: 30,
                              color: primaryColor,
                            ),
                            onChanged: (email) =>
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginEmailChanged(email)),
                            inputErrorText: state.email.invalid
                                ? 'invalid Email'
                                : null,
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return CustomInput(
                            allowMultiline: false,
                            inputMaxLines: null,
                            inputHintText: "Password",
                            inputObscureText: true,
                            leading: const Icon(
                              Icons.lock,
                              size: 30,
                              color: primaryColor,
                            ),
                            onChanged: (password) =>
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginPasswordChanged(password)),
                            inputErrorText: state.password.invalid
                                ? 'invalid password'
                                : null,
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return CustomButton(
                              backgroundColor: secondaryColor,
                              onPressed: state.status.isValidated
                                  ? () {
                                      context
                                          .read<LoginBloc>()
                                          .add(const LoginSubmitted());
                                    }
                                  : null,
                              child: state.status.isSubmissionInProgress
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "LogIn",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/sign-up');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: secondaryColor, fontSize: 18),
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
