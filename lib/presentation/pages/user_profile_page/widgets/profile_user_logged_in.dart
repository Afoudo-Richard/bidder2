import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/header_user_info.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/profile_user_item.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserLoggedIn extends StatelessWidget {
  const ProfileUserLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            HeaderUserInfo(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                CustomContainer(
                  hideShadow: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    children: const [
                      ProfileUserItem(
                        iconContainerColor: Colors.blue,
                        icon: Icons.person,
                        title: 'Security Settings',
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  "Others",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                CustomContainer(
                  hideShadow: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    children: const [
                      ProfileUserItem(
                        iconContainerColor: Colors.indigo,
                        icon: Icons.support,
                        title: 'Support',
                      ),
                      ProfileUserItem(
                        iconContainerColor: Colors.indigo,
                        icon: Icons.bookmarks_rounded,
                        title: 'About Bidder',
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomContainer(
                  hideShadow: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.grey.withOpacity(0.3),
                  child: ProfileUserItem(
                    iconContainerColor: Colors.red,
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () => BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationLogoutRequested()),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
