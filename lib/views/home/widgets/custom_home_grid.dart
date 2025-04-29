import 'package:angelina/views/home/widgets/custom_home_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHomeGrid extends StatefulWidget {
  const CustomHomeGrid({super.key});

  @override
  State<CustomHomeGrid> createState() => _CustomHomeGridState();
}

class _CustomHomeGridState extends State<CustomHomeGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return CustomHomeItem();
        },
      ),
    );
  }
}
