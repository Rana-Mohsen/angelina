import 'dart:ui' as ui;

import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/core/utils/widgets/cusrom_add_remove.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/product/widgets/custom_app_bar.dart';
import 'package:angelina/views/product/widgets/custom_product_slider.dart';
import 'package:angelina/views/product/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: CustomProductSlider(
                      imageList: widget.product.images,
                    ),
                  ),
                  Positioned(top: 1.h, child: CustomAppBar()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      text: widget.product.name,
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xff202020),
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        WidgetSpan(
                          child: CustomRating(iconSize: 17, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 43.w,
                        height: 4.h,
                        child: CustomAddRemove(),
                      ),
                      SizedBox(
                        width: 43.w,
                        height: 4.h,
                        child: CustomAddRemove(),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 16),
                  // const Text("Details", style: FontStyles.textStyle16),
                  // Text(
                  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  //   style: FontStyles.textStyle14.copyWith(color: kGrayColor),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
