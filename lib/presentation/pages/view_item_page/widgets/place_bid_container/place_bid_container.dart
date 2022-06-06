import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class PlaceBidContainer extends StatefulWidget {
  const PlaceBidContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceBidContainer> createState() => _PlaceBidContainerState();
}

class _PlaceBidContainerState extends State<PlaceBidContainer> {
  final amountTextFieldController = TextEditingController(text: '150');

  @override
  void dispose() {
    amountTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Place a Bid',
                  style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          amountTextFieldController.text =  (int.parse(amountTextFieldController.text) - 1).toString();
                        });
                      },
                      child: CustomContainer(
                        hideShadow: true,
                        color: primaryColor,
                        //alignment: Alignment.center,
                        child: Icon(
                          Icons.remove,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          r"FCFA",
                          style: TextStyle(
                            fontSize: 35,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: amountTextFieldController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your bid',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Text(
                          r'Current Bid: $105',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          amountTextFieldController.text =  (int.parse(amountTextFieldController.text) + 1).toString();
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          amountTextFieldController.text =  (int.parse(amountTextFieldController.text) + 1).toString();
                        });
                      },
                      child: CustomContainer(
                        hideShadow: true,
                        color: primaryColor,
                        //alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
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
        ],
      ),
    );
  }
}
