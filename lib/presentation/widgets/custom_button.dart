import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    this.padding,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
            padding ?? const EdgeInsets.symmetric(vertical: 15),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
          )),
      child: child
    );
  }
}
