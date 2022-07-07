import 'package:bidder/presentation/pages/home_page/widgets/Items/item_listing.dart';
import 'package:bidder/presentation/pages/home_page/widgets/search_bar_widget.dart';
import 'package:bidder/presentation/pages/home_page/widgets/selection_type.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/custom_bottom_navigation_bar.dart';
import 'package:bidder/presentation/widgets/screen_app_bar.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentBackgroundColor,
      appBar: ScreenAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SearchBarWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const SelectionType(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const ItemListing(),
        ],
      ),
      // bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
