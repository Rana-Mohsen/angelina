import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/models/home/slider_item_model.dart';
import 'package:angelina/views/home/widgets/custom_slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  List<SliderItemModel> sliderItems = [
    SliderItemModel(image: Assets.banner1, title: "لبشره ناعمة و مشرقة"),
    SliderItemModel(image: Assets.banner2, title: "لاطلالة مميزة وملفتة"),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliderItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return CustomSliderItem(item: sliderItems[itemIndex]);
      },
      options: CarouselOptions(
        aspectRatio: 100.w / 21.h,
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
