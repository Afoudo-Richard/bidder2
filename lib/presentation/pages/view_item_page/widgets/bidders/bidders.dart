import 'package:bidder/presentation/pages/pay_with_momo/pay_with_momo_page.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class Bidders extends StatelessWidget {
  const Bidders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        children: List.generate(
          6,
          (index) => const UserBid(),
        ),
      ),
    );
  }
}

class UserBid extends StatelessWidget {
  const UserBid({
    Key? key,
  }) : super(key: key);

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
                    const Text(
                      "John Stones",
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
              child: const CustomContainer(
                color: secondaryColor,
                hideShadow: true,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Text(
                  r"$105",
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
