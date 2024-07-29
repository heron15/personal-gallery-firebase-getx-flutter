import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.buttonIcon,
    this.iconSize = 14,
    this.leftIconPadding = 0,
    this.rightIconPadding = 0,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 14,
    this.buttonWidth = const Size.fromWidth(double.nan),
    required this.onTap,
  });

  final String buttonText;
  final IconData? buttonIcon;
  final double iconSize;
  final double leftIconPadding;
  final double rightIconPadding;
  final FontWeight fontWeight;
  final double fontSize;
  final Size buttonWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: buttonWidth,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: leftIconPadding, right: rightIconPadding),
            child: Icon(
              buttonIcon,
              size: iconSize,
            ),
          )
        ],
      ),
    );
  }
}
