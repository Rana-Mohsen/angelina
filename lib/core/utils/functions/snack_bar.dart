import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Color(0xffffffff), fontSize: 15),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
      elevation: 1,
      behavior: SnackBarBehavior.floating,
      //width: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        // side: BorderSide(
        //   color: Colors.green,
        //   width: 2,
        // ), // Adjust the radius here too
      ),
      backgroundColor: Colors.green,
    ),
  );
}
