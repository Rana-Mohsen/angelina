import 'package:angelina/models/home/drawer_item_model.dart';
import 'package:angelina/views/home/widgets/custom_drawer_header.dart';
import 'package:angelina/views/home/widgets/custom_drawer_listview.dart';
import 'package:angelina/views/navigation_bar/view_model/cubit/navigation_body_cubit.dart';
import 'package:angelina/views/order/order_history_view.dart';
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
    DrawerItemModel(icon: Icons.home_outlined, view: null),
    DrawerItemModel(icon: Icons.favorite_border_outlined, view: null),
    DrawerItemModel(icon: Icons.shopping_cart_outlined, view: null),
    DrawerItemModel(icon: Icons.person_outline, view: null),
    DrawerItemModel(icon: Icons.history, view: OrderHistoryView()),
  ];

  List<Widget> _buildDrawerItems(BuildContext context) {
    return drawerImages.asMap().entries.map((entry) {
      int index = entry.key;
      DrawerItemModel item = entry.value;

      return DrawerListviewImage(
        onPressed: () {
          if (item.view != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.view!),
            );
          } else {
            BlocProvider.of<NavigationBodyCubit>(context).showBody(index);
          }
        },
        icon: item.icon,
      );
    }).toList();
  }
}
