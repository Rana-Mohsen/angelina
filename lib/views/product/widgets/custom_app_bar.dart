import 'package:angelina/core/utils/widgets/custom_favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          CustomFavoriteIcon(size: 30, padding: 4,),
        ],
      ),
    );
  }
}