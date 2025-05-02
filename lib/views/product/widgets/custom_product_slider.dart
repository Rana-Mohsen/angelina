import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/models/home/slider_item_model.dart';
import 'package:angelina/views/home/widgets/custom_slider_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomProductSlider extends StatefulWidget {
  const CustomProductSlider({super.key, required this.imageList});
  final List<ProductImage> imageList;
  @override
  State<CustomProductSlider> createState() => _CustomProductSliderState();
}

class _CustomProductSliderState extends State<CustomProductSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.imageList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return SizedBox(
          width: 100.w,
          height: 50.h,
          child: CachedNetworkImage(
            imageUrl: widget.imageList[itemIndex].src,
            fit: BoxFit.fitWidth,
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => Center(
                  child: Icon(Icons.error, color: Colors.red, size: 40),
                ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 100.w / 50.h,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlay: true,
        // enlargeCenterPage: true,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        initialPage: 0,
      ),
    );
  }
}
