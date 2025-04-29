import 'package:angelina/views/home/models/drawer_item_model.dart';
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
      child: Column(
        children: [const CustomDrawerHeader(), ..._buildDrawerItems()],
      ),
    );
  }

  final List<DrawerItemModel> drawerImages = const [
    DrawerItemModel( icon: Icons.home, view: Center(child: Text("999"))),
    DrawerItemModel(icon:Icons.favorite_border_outlined, view: Center(child: Text("222"))),
  ];

  List<Widget> _buildDrawerItems() {
    return drawerImages.map((item) {
      return DrawerListviewImage(icon: item.icon, view: item.view);
    }).toList();
  }
}
