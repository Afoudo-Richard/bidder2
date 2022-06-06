import 'package:bidder/presentation/pages/view_item_page/widgets/Item_detail_info/item_detail_info.dart';
import 'package:bidder/presentation/pages/view_item_page/widgets/bidders/bidders.dart';
import 'package:bidder/presentation/pages/view_item_page/widgets/header_info/header_info.dart';
import 'package:bidder/presentation/pages/view_item_page/widgets/place_bid_container/place_bid_container.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class ViewItemPageLayout extends StatefulWidget {
  const ViewItemPageLayout({Key? key}) : super(key: key);

  @override
  State<ViewItemPageLayout> createState() => _ViewItemPageLayoutState();
}

class _ViewItemPageLayoutState extends State<ViewItemPageLayout> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: contentBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderInfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const ItemDetailInfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Bidders(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: paddingSize, right: paddingSize, bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                blurRadius: 40,
                spreadRadius: 10,
                offset: Offset(0, -40),
              ),
            ],
          ),
          child: CustomButton(
            onPressed: () {
              showModalBottomSheet(
                barrierColor: primaryColor.withOpacity(0.7),
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return const PlaceBidContainer();
                },
              );
            },
            child: const Text(
              "Place a Bid!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// InkWell(
//         onTap: () {
//           showModalBottomSheet(
//               barrierColor: primaryColor.withOpacity(0.7),
//               isScrollControlled: true,
//               context: context,
//               builder: (ctx) {
//                 return PlaceBidContainer();
//               });
//         },
//         child: Container(
//           color: Colors.white.withOpacity(0.0),
//           padding: EdgeInsets.only(
//               left: paddingSize, right: paddingSize, bottom: 10),
//           child: CustomContainer(
//             padding: EdgeInsets.symmetric(vertical: 20),
//             color: primaryColor,
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.white60,
//                 blurRadius: 40,
//                 spreadRadius: 10,
//                 offset: Offset(0, -40),
//               ),
//             ],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Place a Bid!",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.5),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
