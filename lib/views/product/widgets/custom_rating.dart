import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, this.iconSize = 12, this.fontSize = 10});
  final double? iconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "(4.8)",
          style: TextStyle(
            color: kGreenColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(Icons.star, size: iconSize, color: kGreenColor),
      ],
    );
  }
}
