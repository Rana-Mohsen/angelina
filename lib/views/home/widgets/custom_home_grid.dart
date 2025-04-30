import 'package:angelina/views/home/widgets/custom_home_item.dart';
import 'package:angelina/views/product/product_details_view.dart';
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
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .51,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsView()),
              );
            },
            child: CustomHomeItem(),
          );
        },
      ),
    );
  }
}
