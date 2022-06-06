import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/profile_user_item.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderUserInfo extends StatelessWidget {
  const HeaderUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Column(
          children: [
            const CircleAvatar(
              backgroundColor: primaryColor,
              radius: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "${state.user!.firstname} ${state.user!.lastname}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              state.user!.email,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            Text(
              state.user!.phone,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomContainer(
              hideShadow: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                children: const [
                  ProfileUserItem(
                    icon: Icons.person,
                    title: 'Personal Details',
                  ),
                  ProfileUserItem(
                    icon: Icons.book,
                    title: 'My Records',
                  ),
                  ProfileUserItem(
                    icon: Icons.people,
                    title: 'Invite friends',
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
