import 'package:bidder/presentation/pages/add_item_page/add_item_page.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/favorites_page/favorites_page.dart';
import 'package:bidder/presentation/pages/home_page/home_page.dart';
import 'package:bidder/presentation/pages/user_profile_page/user_profile_page.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const HomePage(),
      const FavoritesPage(),
      const AddItemPage(),
      const FavoritesPage(),
      const UserProfilePage(),
    ];

    final kTabPageTitles = ["Home", "Prices", "Buy & Sell", "Activity", ""];
    return Scaffold(
      body: _kTabPages[_currentPage],
      bottomNavigationBar: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 10.0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
            ),
            backgroundColor: Colors.white,
            currentIndex: _currentPage,
            items: [
              _bottomNavItem(
                index: 0,
                icon: Icons.home,
                text: "Home",
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              _bottomNavItem(
                index: 1,
                icon: Icons.favorite,
                text: "Favorites",
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              _bottomNavItem(
                index: 2,
                icon: Icons.add,
                text: "Add",
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              _bottomNavItem(
                index: 3,
                icon: Icons.dashboard,
                text: "Dashboard",
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              _bottomNavItem(
                index: 4,
                icon: Icons.person,
                text: "Profile",
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required IconData icon,
    required String text,
    required index,
    required void Function(int x) onTap,
  }) {
    return BottomNavigationBarItem(
      label: text,
      icon: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Icon(
          icon,
          color: _getItemColor(index),
          size: 25.0,
        ),
      ),
    );
  }

  Color _getItemColor(int index) =>
      _currentPage == index ? primaryColor : Colors.grey;
}
