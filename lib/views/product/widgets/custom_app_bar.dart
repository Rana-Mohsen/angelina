import 'package:angelina/core/widgets/custom_favorite_icon.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.product,});
final ProductModel product;
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
          CustomFavoriteIcon(size: 30, padding: 4,product: product,),
        ],
      ),
    );
  }
}