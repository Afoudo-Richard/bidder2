import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Item extends StatefulWidget {
  const Item({
    Key? key,
    this.onTap,
    required this.product,
  }) : super(key: key);

  final void Function()? onTap;
  final Product product;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late CountdownTimerController controller;
  int endTime =
      DateTime(2022, 4, 12, 12, 10).millisecondsSinceEpoch * 1000 * 30;
  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
      endTime: endTime,
      onEnd: () => print("I am done"),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      final cardHeight = 300;
      final imageContainerHeight = cardHeight * 0.7; // 70%
      final infoContainerHeight = cardHeight - imageContainerHeight; // 30%
      final countDownInfoHeight = cardHeight * 0.15;
      final infoContainerPadding = 15.0;
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 300,
          margin: EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: imageContainerHeight,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/item_images/goal.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: infoContainerHeight,
                    width: double.infinity,
                    padding: EdgeInsets.all(infoContainerPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.productName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          widget.product.productDescription,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: infoContainerHeight -
                    (infoContainerPadding / 2) -
                    ((countDownInfoHeight) / 2) +
                    5,
                right: 0,
                child: Container(
                  height: countDownInfoHeight,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            CountdownTimer(
                              controller: controller,
                              widgetBuilder: (_, remainingTime) {
                                if (remainingTime == null) {
                                  Text("Time is finish");
                                } else {
                                  return Text(
                                    '${remainingTime.days}d ${remainingTime.hours}h ${remainingTime.min}m ${remainingTime.sec}s',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: primaryColor,
                        child: Text(
                          'FCFA ${widget.product.productPrice}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CustomContainer(
                  child: Icon(
                    Icons.favorite_border,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
