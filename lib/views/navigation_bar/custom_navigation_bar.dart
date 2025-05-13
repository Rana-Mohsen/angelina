import 'package:angelina/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:angelina/views/cart/cart_view.dart';
import 'package:angelina/views/favourite/favorite_view.dart';
import 'package:angelina/views/home/home_view.dart';
import 'package:angelina/views/navigation_bar/view_model/cubit/navigation_body_cubit.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<String> titles = ['الرئيسية', 'المفضلة', 'العربة', 'Profile'];
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_border_outlined,
    Icons.shopping_cart_outlined,
    Icons.person_outlined,
  ];
  List<Widget> pages = const [
    HomeView(),
    FavoriteView(),
    CartView(),
    ProfileView(), 
  ];
  Color inactive = Color(0xff787676);
  Color active = Color(0xff0C3A3F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<NavigationBodyCubit, NavigationBodyState>(
              builder: (context, state) {
                int selectedIndex =
                    BlocProvider.of<NavigationBodyCubit>(context).selectedIndex;
                return pages[selectedIndex];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _navbar(),
    );
  }

  Widget _navbar() {
    return Container(
      height: 8.h, // Preserved height
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
          ),
        ],
      ),
      child: BlocBuilder<NavigationBodyCubit, NavigationBodyState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                icons.reversed.map((icon) {
                  int index = icons.indexOf(icon);
                  int selectedIndex =
                      BlocProvider.of<NavigationBodyCubit>(
                        context,
                      ).selectedIndex;
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBodyCubit>(
                        context,
                      ).showBody(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          color: isSelected ? active : inactive,
                          size: 30,
                        ),
                        Text(
                          titles[index],
                          style: TextStyle(
                            color: isSelected ? active : inactive,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
