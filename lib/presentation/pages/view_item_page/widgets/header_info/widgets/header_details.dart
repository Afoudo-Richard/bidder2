import 'package:bidder/data/model/models.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class ViewItemHeaderInfoDetails extends StatefulWidget {
  const ViewItemHeaderInfoDetails({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ViewItemHeaderInfoDetails> createState() =>
      _ViewItemHeaderInfoDetailsState();
}

class _ViewItemHeaderInfoDetailsState extends State<ViewItemHeaderInfoDetails> {
  late CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
      endTime: DateTime.parse(widget.product.bidEndTime).millisecondsSinceEpoch,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r"$105",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Text(
              'Current Bid',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.15,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Text(
              'Auction Ends',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
