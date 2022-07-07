import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class UserNotLoggedIn extends StatelessWidget {
  const UserNotLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              backgroundColor: secondaryColor,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                "LogIn",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Or",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              backgroundColor: secondaryColor,
              onPressed: () {
                 Navigator.pushReplacementNamed(context, '/sign-up');
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
