import 'package:angelina/models/home/drawer_item_model.dart';
import 'package:angelina/views/home/widgets/custom_drawer_header.dart';
import 'package:angelina/views/home/widgets/custom_drawer_listview.dart';
import 'package:angelina/views/navigation_bar/view_model/cubit/navigation_body_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      width: 20.w,
      child: Column(
        children: [const CustomDrawerHeader(), ..._buildDrawerItems(context)],
      ),
    );
  }

  final List<DrawerItemModel> drawerImages = const [
    DrawerItemModel(
      icon: Icons.home_outlined,
      view: Center(child: Text("999")),
    ),
    DrawerItemModel(
      icon: Icons.favorite_border_outlined,
      view: Center(child: Text("222")),
    ),
    DrawerItemModel(
      icon: Icons.shopping_cart_outlined,
      view: Center(child: Text("0002")),
    ),
  ];

 List<Widget> _buildDrawerItems(BuildContext context) {
  return drawerImages.asMap().entries.map((entry) {
    int index = entry.key; 
    DrawerItemModel item = entry.value;

    return DrawerListviewImage(
      onPressed: () => BlocProvider.of<NavigationBodyCubit>(context).showBody(index),
      icon: item.icon,
      view: item.view,
    );
  }).toList();
}

}
