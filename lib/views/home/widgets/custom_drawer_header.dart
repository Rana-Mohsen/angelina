import 'package:angelina/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 11.h,
      child: DrawerHeader(
        padding: const EdgeInsets.only(left: 0),
        decoration: const BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 4),
              child: AspectRatio(
                aspectRatio: 2 / 4,
                child: SvgPicture.asset(Assets.logo),
              ),
            ),
            const Text(
              'Cards available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}