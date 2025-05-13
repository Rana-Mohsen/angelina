import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/views/profile/widgets/edit_profile_image.dart';
import 'package:angelina/views/profile/widgets/user%20info.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<Map<String, dynamic>> listTileData = const [
    {"icon": "assets/icons/profile/battery.png", "title": "History of order"},
    //{"icon": "assets/icons/profile/pay_method.png", "title": "Payment method"},
    {"icon": "assets/icons/profile/notification.png", "title": "Notification"},
    {"icon": "assets/icons/profile/promo_code.png", "title": "Promo code"},
  ];
  bool isLoading = true;
  // late UserModel user;
  @override
  // void initState() {
  //   super.initState();
  //   getUserInfo();
  // }
  // Future<void> getUserInfo() async {
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            EditProfileImage(),
            UserInfo(),
            const Divider(indent: 16, endIndent: 16),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listTileData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // if (listTileData[index]["title"] == "Notification") {
                      //   context.push(listTileData[index]["route"]);
                      // }
                    },
                    child: ListTile(
                      leading: SizedBox(
                        height: 2.8.h,
                        width: 6.w,
                        child: Image.asset(Assets.ctg1),
                      ),
                      title: Text(listTileData[index]["title"]!),
                      // titleTextStyle: FontStyles.textStyle18,
                      textColor: const Color(0xff575757),
                      // subtitle: Text("OmarAli2000@gmail.com"),
                      trailing:
                          index < 8
                              ? IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios),
                              )
                              : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
