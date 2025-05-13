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
    {"icon": Icons.history, "title": "الطلبات"},
    //{"icon": "assets/icons/profile/pay_method.png", "title": "Payment method"},
    {"icon": Icons.notifications, "title": "الاشعارات"},
    {"icon": Icons.sell, "title": "اكواد الخصم"},
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
            SizedBox(height: 3.h),
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
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        // leading: SizedBox(`
                        //   height: 2.8.h,
                        //   width: 6.w,
                        //   child: Icon(listTileData[index]["icon"]!),
                        // ),
                        title: Text(listTileData[index]["title"]!),
                        titleTextStyle: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textColor: const Color(0xff575757),
                        // subtitle: Text("OmarAli2000@gmail.com"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
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
