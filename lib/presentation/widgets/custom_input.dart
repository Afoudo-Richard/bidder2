import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.leading,
    this.inputTextStyle,
    this.inputHintText,
    this.inputErrorText,
    this.inputBorder,
    this.controller,
    this.textAlign,
    this.inputKeyBoardType,
    this.inputObscureText,
    this.onChanged,
    this.inputInitialValue,
    this.inputMaxLines,
    this.allowMultiline = true,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final TextStyle? inputTextStyle;
  final String? inputHintText;
  final String? inputErrorText;
  final InputBorder? inputBorder;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final TextInputType? inputKeyBoardType;
  final bool? inputObscureText;
  final void Function(String)? onChanged;
  final String? inputInitialValue;
  final int? inputMaxLines;
  final bool allowMultiline;

  @override
  Widget build(BuildContext context) {
    return allowMultiline
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            child: Row(
              children: [
                if (leading != null) leading!,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: inputMaxLines,
                    initialValue: inputInitialValue,
                    keyboardType: inputKeyBoardType,
                    obscureText: inputObscureText ?? false,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ).merge(inputTextStyle),
                    decoration: InputDecoration(
                      border: inputBorder ?? InputBorder.none,
                      hintText: inputHintText,
                      errorText: inputErrorText,
                    ),
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            child: Row(
              children: [
                if (leading != null) leading!,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: TextField(
                    //maxLines: inputMaxLines,
                    keyboardType: inputKeyBoardType,
                    obscureText: inputObscureText ?? false,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ).merge(inputTextStyle),
                    decoration: InputDecoration(
                      border: inputBorder ?? InputBorder.none,
                      hintText: inputHintText,
                      errorText: inputErrorText,
                    ),
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          );
  }
}
