import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.pickedImage});
  final File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 13.h,
        width: 13.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: pickedImage != null ? Colors.white : Colors.grey,
        ),
        child:
            pickedImage != null
                ? Image.file(pickedImage!, fit: BoxFit.cover)
                : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 13.h,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}
