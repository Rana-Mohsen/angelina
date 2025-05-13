import 'dart:io';

import 'package:angelina/constants.dart';
import 'package:angelina/views/profile/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({super.key});

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  File? pickedImage;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        pickedImage = imageTemp;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13.h,
      height: 13.h,
      child: Stack(
        children: [
          ProfileImage(pickedImage: pickedImage),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 2.h,
              backgroundColor: kGreenColor,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () async {
                  await pickImage();
                },
                icon: Icon(
                  FontAwesome.pen_to_square,
                  size: 2.h,
                  color: Colors.white,
                ), // Adjust icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
