import 'package:bidder/data/selection_types.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class SelectionType extends StatefulWidget {
  const SelectionType({Key? key}) : super(key: key);

  @override
  State<SelectionType> createState() => _SelectionTypeState();
}

class _SelectionTypeState extends State<SelectionType> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: paddingSize),
          itemCount: selectionTypes.length,
          itemBuilder: (BuildContext context, int index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  selectionTypes[index],
                  style: TextStyle(
                    color: isSelected ? primaryColor : Colors.grey,
                    fontSize: isSelected ? 20 : 18,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
