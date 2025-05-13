import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.item});
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1.h,
      children: [
        ClipOval(
          child: Container(
            height: 9.h,
            width: 9.h,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child:
                item.image == null
                    ? Image.asset(Assets.ctg1, fit: BoxFit.cover)
                    : Image.network(item.image!),
          ),
        ),
        Text(item.name, textAlign: TextAlign.center),
      ],
    );
  }
}
