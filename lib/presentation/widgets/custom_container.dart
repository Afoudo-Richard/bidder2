import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.hideShadow = false,
    this.borderRadius,
    this.padding,
    this.color,
    this.alignment,
    this.boxShadow,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final bool hideShadow;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(5),
      height: height,
      width: width,
      alignment: alignment,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10) ,
        boxShadow: boxShadow ?? (!hideShadow
            ? const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                ),
              ]
            : []),
      ),
      child: child
    );
  }
}
