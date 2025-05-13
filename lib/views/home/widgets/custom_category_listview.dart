import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/category/category_model.dart';
import 'package:angelina/models/home/category_item_model.dart';
import 'package:angelina/views/category/category_view.dart';
import 'package:angelina/views/home/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCategoryListview extends StatefulWidget {
  const CustomCategoryListview({super.key, required this.categories});
  final List<CategoryModel> categories;
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
    var ctg = widget.categories;
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 15, bottom: 15),
      child: SizedBox(
        height: 13.5.h,
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: ctg.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryView(ctg: ctg[index]),
                  ),
                );
              },
              child: CustomCategory(item: ctg[index]),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 5.w); // Adjust spacing as needed
          },
        ),
      ),
    );
  }
}
