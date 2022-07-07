import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/custom_bottom_navigation_bar.dart';
import 'package:bidder/presentation/widgets/screen_app_bar.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class FavoritesLayout extends StatelessWidget {
  const FavoritesLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentBackgroundColor,
      appBar: ScreenAppBar(),
      body: Column(
        children: [
          Text("Favorites pages here"),
        ],
      ),
      // bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
