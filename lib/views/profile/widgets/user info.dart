import 'package:angelina/constants.dart';
import 'package:angelina/core/services/local_storage/user_pref.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String? savedName = await UserPreferences.loadName();
    String? savedEmail = await UserPreferences.loadEmail();

    setState(() {
      nameController.text = savedName ?? "UserName";
      emailController.text = savedEmail ?? "Email";
    });
  }

  Future<void> _saveUserData() async {
    await UserPreferences.saveName(
      nameController.text == "" ? "userName" : nameController.text,
    );
    await UserPreferences.saveEmail(
      emailController.text == "" ? "email" : emailController.text,
    );
  }

  void toggleEdit() async {
    if (isEditing) {
      await _saveUserData(); // Save when editing is finished
    }
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
                    decoration: InputDecoration(
                      hintText: "userName",
                      hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
                    ),

                    style: TextStyle(fontSize: 19.sp),
                    // decoration: const InputDecoration(border: InputBorder.none),
                  ),
                )
                : Text(nameController.text, style: TextStyle(fontSize: 19.sp)),

            isEditing
                ? SizedBox(
                  height: 5.h,
                  width: 50.w,
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
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
