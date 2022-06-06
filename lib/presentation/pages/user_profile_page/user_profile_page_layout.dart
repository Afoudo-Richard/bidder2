import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/header_user_info.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/profile_user_item.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/user_logged_in/user_logged_in.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/user_not_logged_in/user_not_logged_in.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/custom_bottom_navigation_bar.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePageLayout extends StatelessWidget {
  const UserProfilePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return !state.authenticated ? const UserNotLoggedIn() : const UserLoggedIn();
        },
      ),
      bottomNavigationBar: const CustomButtomNavigationBar(),
    );
  }
}
