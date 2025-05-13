import 'package:angelina/constants.dart';
import 'package:angelina/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 11.h,
      child: DrawerHeader(
        padding: const EdgeInsets.only(left: 0),
        decoration: const BoxDecoration(color: kGreenColor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 4),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(Assets.logo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
