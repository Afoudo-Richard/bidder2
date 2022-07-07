import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Item extends StatefulWidget {
  const Item({
    Key? key,
    this.onTap,
    required this.product,
  }) : super(key: key);

  final void Function()? onTap;
  final Product product;

  @override
  State<Item> createState() => _ItemState(this.product);
}

class _ItemState extends State<Item> {
  final Product myproduct;
  _ItemState(this.myproduct);

  late CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
      endTime: DateTime.parse(myproduct.bidEndTime).millisecondsSinceEpoch,
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
                    // child: Image.asset(
                    //   'assets/images/item_images/goal.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                    // child: Image.network(
                    //   widget.product.images[0]['url'],
                    //   fit: BoxFit.cover,
                    // ),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 400,
                        // aspectRatio: 16 / 9,
                        // viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: widget.product.images.length,
                      itemBuilder: (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) =>
                          Container(
                        child: Image.network(
                          widget.product.images[itemIndex]['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  return Text("Time is Due!!!");
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
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
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
                ],
              ),
              // Positioned(
              //   bottom: infoContainerHeight -
              //       (infoContainerPadding / 2) -
              //       ((countDownInfoHeight) / 2) +
              //       5,
              //   right: 0,
              //   child: Container(
              //     height: countDownInfoHeight,
              //     clipBehavior: Clip.hardEdge,
              //     decoration: const BoxDecoration(
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(10),
              //           bottomLeft: Radius.circular(10),
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black45,
              //             blurRadius: 10,
              //             spreadRadius: 1,
              //             offset: Offset(0, 1),
              //           ),
              //         ]),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: double.infinity,
              //           alignment: Alignment.center,
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 5),
              //           color: Colors.white,
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.timer,
              //                 size: 20,
              //               ),
              //               SizedBox(
              //                 width: MediaQuery.of(context).size.width * 0.01,
              //               ),
              //               CountdownTimer(
              //                 controller: controller,
              //                 widgetBuilder: (_, remainingTime) {
              //                   if (remainingTime == null) {
              //                     Text("Time is finish");
              //                   } else {
              //                     return Text(
              //                       '${remainingTime.days}d ${remainingTime.hours}h ${remainingTime.min}m ${remainingTime.sec}s',
              //                       style: const TextStyle(
              //                         color: primaryColor,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16,
              //                       ),
              //                     );
              //                   }
              //                   return const SizedBox();
              //                 },
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           height: double.infinity,
              //           alignment: Alignment.center,
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 5),
              //           color: primaryColor,
              //           child: Text(
              //             'FCFA ${widget.product.productPrice}',
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
