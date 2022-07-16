import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar ScreenAppBar() {
  return AppBar(
    backgroundColor: primaryColor,
    title: const Text(
      "Bidder",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
    ),
    actions: [
      Stack(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            iconSize: 28,
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          // Positioned(
          //   bottom: 7,
          //   right: 5,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          //     decoration: BoxDecoration(
          //       color: secondaryColor,
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     child: Text(
          //       '5',
          //       style: TextStyle(color: Colors.black,
          //       fontWeight: FontWeight.bold
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),

      // BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //   builder: (context, state) {
      //     return Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Center(
      //         child: Text(
      //           "Hi ${state.user!.firstname}",
      //           style: TextStyle(
      //             fontSize: 16,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    ],
  );
}
