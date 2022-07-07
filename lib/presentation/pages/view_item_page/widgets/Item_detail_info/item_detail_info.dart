import 'package:bidder/data/model/models.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class ItemDetailInfo extends StatelessWidget {
  const ItemDetailInfo({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Text(
                    product.productDescription,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                "More info",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: const [
          //     ItemDetailProperties(
          //       title: 'Condition',
          //       value: 'New',
          //     ),
          //     ItemDetailProperties(
          //       title: 'Year',
          //       value: '2019',
          //     ),
          //     ItemDetailProperties(
          //       title: 'Size',
          //       value: 'Small',
          //     ),
          //     ItemDetailProperties(
          //       title: 'Starting Bid',
          //       value: r'$50',
          //     ),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          CustomButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                const Text(
                  "Call",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailProperties extends StatelessWidget {
  const ItemDetailProperties({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
