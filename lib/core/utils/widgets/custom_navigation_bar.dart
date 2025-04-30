import 'package:angelina/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<String> titles = ['Home', 'Favorite', 'Cart', 'Profile'];
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_border_outlined,
    Icons.shopping_cart_outlined,
    Icons.person_outlined,
  ];
  int selectedIndex = 0;
  List<Widget> pages = const [
    HomeView(),
    Text("favourit"),
    Text("cart"),
    Text("profile"),
  ];
  Color inactive = Color(0xff787676);
  Color active = Color(0xff0C3A3F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          Align(alignment: Alignment.bottomCenter, child: _navbar()),
        ],
      ),
    );
  }

  Widget _navbar() {
    return Container(
      height: 8.h,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            icons.reversed.map((icon) {
              int index = icons.indexOf(icon);
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 15,
                        right: 15,
                      ),
                      child: Icon(
                        icons[index],
                        color: isSelected ? active : inactive,
                        size: 30,
                      ),
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
      ),
    );
  }
}
