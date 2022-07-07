import 'dart:io';

import 'package:bidder/presentation/pages/add_item_page/bloc/add_item_bloc.dart';
import 'package:bidder/presentation/pages/add_item_page/widgets/add_item_state_layout.dart';
import 'package:bidder/presentation/pages/add_item_page/widgets/add_item_user_logged_in.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/custom_bottom_navigation_bar.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/presentation/widgets/user_not_logged_in.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddItemPageLayout extends StatefulWidget {
  const AddItemPageLayout({Key? key}) : super(key: key);

  @override
  State<AddItemPageLayout> createState() => _AddItemPageLayoutState();
}

class _AddItemPageLayoutState extends State<AddItemPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Add item",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return !state.authenticated
              ? const UserNotLoggedIn()
              : const AddItemStateLayout();
        },
      ), // bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
