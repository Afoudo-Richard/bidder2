import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: pagePadding,
      child: CustomInput(
        inputHintText: "What are you looking for ?",
        inputTextStyle: TextStyle(
          fontSize: 16,
        ),
        leading: const Icon(
          Icons.search,
          size: 30,
          color: primaryColor,
        ),
      ),
    );
  }
}
