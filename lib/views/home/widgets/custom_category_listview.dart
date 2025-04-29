import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/views/home/models/category_item_model.dart';
import 'package:angelina/views/home/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategoryListview extends StatefulWidget {
  const CustomCategoryListview({super.key});

  @override
  State<CustomCategoryListview> createState() => _CustomCategoryListviewState();
}

class _CustomCategoryListviewState extends State<CustomCategoryListview> {
  final List<CategoryItemModel> categoryItems = [
    CategoryItemModel(image: Assets.ctg1, title: "اكسسوارات"),
    CategoryItemModel(image: Assets.ctg2, title: "منتجات عناية"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return CustomCategory(item: categoryItems[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 5.w); // Adjust spacing as needed
        },
      ),
    );
  }
}
