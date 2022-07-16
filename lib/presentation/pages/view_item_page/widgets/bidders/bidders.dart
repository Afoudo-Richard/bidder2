import 'package:bidder/data/model/backend/bidder.dart';
import 'package:bidder/presentation/pages/pay_with_momo/pay_with_momo_page.dart';
import 'package:bidder/presentation/pages/view_item_page/bloc/view_item_bloc_bloc.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bidders extends StatelessWidget {
  const Bidders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: BlocBuilder<ViewItemBlocBloc, ViewItemBlocState>(
        builder: (context, state) {
          print(state.biddersStatus);
          switch (state.biddersStatus) {
            case BiddersStatus.success:
              return Column(
                children: List.generate(
                  state.bidders.length,
                  (index) => UserBid(bidder: state.bidders[index]),
                ),
              );
            case BiddersStatus.intial:
            case BiddersStatus.loading:
              return Container(
                margin: EdgeInsets.only(top: 30),
                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: primaryColor,
                    color: secondaryColor,
                  ),
                ),
              );

            case BiddersStatus.failure:
              return Container(
                margin: EdgeInsets.only(top: 30),
                child: const Center(
                  child: Text("Could not fetch bidders"),
                ),
              );
          }
        },
      ),
    );
  }
}

class UserBid extends StatelessWidget {
  const UserBid({
    Key? key,
    required this.bidder,
  }) : super(key: key);

  final Bidder bidder;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final userImageSize = MediaQuery.of(context).size.width * 0.11;
      return Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: userImageSize,
                  width: userImageSize,
                  padding: EdgeInsets.zero,
                  hideShadow: true,
                  color: Colors.orange,
                  child: Image.asset(
                    'assets/images/users_images/john.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bidder.user.firstname,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.000,
                    ),
                    const Text(
                      '34s ago',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PayWithMomoPage();
                      },
                    ),
                  )),
              child: CustomContainer(
                color: secondaryColor,
                hideShadow: true,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Text(
                  "FCFA ${bidder.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
