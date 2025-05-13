import 'dart:io';
import 'package:angelina/constants.dart';
import 'package:angelina/core/services/local_storage/user_pref.dart';
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

    @override
  void initState() {
    super.initState();
    _loadUserImage();
  }

  Future<void> _loadUserImage() async {
    String? savedImagePath = await UserPreferences.loadImagePath();
    if (savedImagePath != null) {
      setState(() {
        pickedImage = File(savedImagePath); 
      });
    }
  }

  Future<void> _saveImage(String imagePath) async {
    await UserPreferences.saveImagePath(imagePath);
    setState(() {
      pickedImage = File(imagePath); 
    });
  }
  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      //final imageTemp = File(image.path);
      setState(() async{
        await _saveImage(image.path);
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
     // final imageTemp = File(image.path);
      setState(() async{
        await _saveImage(image.path);
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
                onPressed: () {
                  _showImagePicker(context);
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

  void _showImagePicker(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 10,
      context: ctx,
      builder: (ctx) => SizedBox(
        height: 15.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageOption(Icons.camera, pickImageFromCamera),
            SizedBox(width: 5.w),
            _imageOption(Icons.image, pickImageFromGallery),
          ],
        ),
      ),
    );
  }

  Widget _imageOption(IconData icon, Future Function() onPressed) {
    return CircleAvatar(
      radius: 5.h,
      backgroundColor: kGreenColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () async {
          await onPressed();
          Navigator.pop(context); 
        },
        icon: Icon(icon, size: 5.h, color: Colors.white),
      ),
    );
  }
}