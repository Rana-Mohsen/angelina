import 'package:angelina/views/home/models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.item});
  final CategoryItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipOval(
            child: Container(
              height: 18.w,
              width: 18.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
        ),
        Text(item.title, textAlign: TextAlign.center),
      ],
    );
  }
}
