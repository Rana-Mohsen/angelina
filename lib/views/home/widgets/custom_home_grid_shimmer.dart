import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomHomeGridShimmer extends StatelessWidget {
  const CustomHomeGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
    baseColor: Colors.grey[400]!,
    highlightColor:  Colors.grey[300]!,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 41.5.h,
        //childAspectRatio: 0.51.w / 0.486.h,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return itemShimmer();
      },
    )
  );
  }
  Widget itemShimmer(){
    return Container(
      padding: EdgeInsets.all(10),
      // width: 40.w,
      // height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withAlpha(30),
            spreadRadius: 2,
          ),
        ],
      ),

      child: Column(
        spacing: 5,
        children: [
          Container(
            height: 22.h,
            // width: 40.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
         
        
        ],
      ),
    );
  }
}