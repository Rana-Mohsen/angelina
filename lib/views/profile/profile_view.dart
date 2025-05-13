import 'package:angelina/constants.dart';
import 'package:angelina/models/profile_tile_model.dart';
import 'package:angelina/views/order/order_history_view.dart';
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
  final List<ProfileTileModel> listTileData = [
    ProfileTileModel(
      icon: Icons.history,
      title: "الطلبات",
      view: OrderHistoryView(),
    ),
    ProfileTileModel(icon: Icons.notifications, title: "الاشعارات", view: null),
    ProfileTileModel(icon: Icons.sell, title: "اكواد الخصم", view: null),
  ];

  bool isLoading = true;

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
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Icon(
                        listTileData[index].icon!,
                        color: kGreenColor,
                        size: 8.w,
                      ),
                      title: Text(listTileData[index].title),
                      titleTextStyle: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textColor: const Color(0xff575757),
                      // subtitle: Text("OmarAli2000@gmail.com"),
                      trailing: IconButton(
                        onPressed: () {
                           if (listTileData[index].view != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => listTileData[index].view!,
                        ),
                      );
                    }
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
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
