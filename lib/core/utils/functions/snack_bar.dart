import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
      backgroundColor: kGreenColor,
    ),
  );
}
