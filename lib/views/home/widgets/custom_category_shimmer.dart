import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 15, bottom: 15),
        child: SizedBox(
          height: 9.h,
          child: ListView.separated(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _caregoryItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 5.w);
            },
          ),
        ),
      ),
    );
  }

  Widget _caregoryItem() {
    return SizedBox(
    height: 9.h, // Ensure the height matches width
    width: 9.h,
    child: ClipOval(
      child: Container(
        color: Colors.grey, // Background shimmer color
      ),
    ),
  );
  }
}
