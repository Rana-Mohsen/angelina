import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/views/home/home_view.dart';
import 'package:angelina/views/home/models/drawer_item.dart';
import 'package:angelina/views/home/widgets/custom_drawer_header.dart';
import 'package:angelina/views/home/widgets/custom_drawer_listview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 50.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const CustomDrawerHeader(),
          ..._buildDrawerItems(),
        ],
      ),
    );
  }

  final List<DrawerItem> drawerImages = const [
    DrawerItem(
      icon: Assets.logo,
      view: HomeView(),
    ),
    DrawerItem(
      icon: Assets.logo,
      view: Center(child: Text("222")),
    ),
  ];

  List<Widget> _buildDrawerItems() {
    return drawerImages.map((item) {
      return DrawerListviewImage(
        image: item.icon,
        view: item.view,
      );
    }).toList();
  }
}