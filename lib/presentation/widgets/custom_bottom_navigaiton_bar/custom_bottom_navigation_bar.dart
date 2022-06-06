import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/favorites_page/favorites_page.dart';
import 'package:bidder/presentation/pages/user_profile_page/user_profile_page.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/cubit/bottomnavigationbar_cubit.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:bidder/utils/system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Builder(builder: (context) {
        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBottomNavigationBarItem(
                    index: 0,
                    icon: Icons.apps,
                    title: 'Home',
                    onTap: () {
                      BlocProvider.of<BottomnavigationbarCubit>(context)
                          .updateSelected(0);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  CustomBottomNavigationBarItem(
                    index: 1,
                    icon: Icons.favorite,
                    title: 'Favorites',
                    onTap: () {
                      BlocProvider.of<BottomnavigationbarCubit>(context)
                          .updateSelected(1);
                      //Navigator.of(context).pushNamed('/favorites');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return FavoritesPage();
                      }));
                    },
                  ),
                  if (state.authenticated)
                    CustomBottomNavigationBarItem(
                      index: 2,
                      icon: Icons.add,
                      title: 'Add',
                      onTap: () {
                        BlocProvider.of<BottomnavigationbarCubit>(context)
                            .updateSelected(2);
                        Navigator.pushReplacementNamed(context, '/add-item');
                      },
                    ),
                  CustomBottomNavigationBarItem(
                    index: 3,
                    icon: Icons.dashboard,
                    title: 'Dashboard',
                    onTap: () {
                      BlocProvider.of<BottomnavigationbarCubit>(context)
                          .updateSelected(3);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return FavoritesPage();
                      }));
                    },
                  ),
                  CustomBottomNavigationBarItem(
                    index: 4,
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      BlocProvider.of<BottomnavigationbarCubit>(context)
                          .updateSelected(4);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserProfilePage();
                          },
                        ),
                      );
                    },
                  ),
                ]);
          },
        );
      }),
    );
  }
}
