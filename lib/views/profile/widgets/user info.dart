import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController(text: "rana");
  TextEditingController emailController = TextEditingController(text: "email");

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 12.w),
        Column(
          children: [
            isEditing
                ? SizedBox(
                  height: 5.h,
                  width: 50.w,
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(fontSize: 20.sp),
                    // decoration: const InputDecoration(border: InputBorder.none),
                  ),
                )
                : Text(nameController.text, style: TextStyle(fontSize: 20.sp)),

            isEditing
                ? SizedBox(
                  height: 5.h,
                  width: 50.w,
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(fontSize: 16.sp),
                    //decoration: const InputDecoration(border: InputBorder.none),
                  ),
                )
                : Text(emailController.text, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
        IconButton(
          icon: Icon(isEditing ? Icons.check : Icons.edit),
          color: kGreenColor,
          onPressed: toggleEdit,
        ),
      ],
    );
  }
}
