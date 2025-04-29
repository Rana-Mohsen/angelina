import 'package:angelina/constants.dart';
import 'package:angelina/views/home/models/slider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSliderItem extends StatelessWidget {
  const CustomSliderItem({super.key, required this.item});
  final SliderItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 25.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        spacing: 10,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: 40.w,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                color: const Color(0xff242424),
                // overflow: TextOverflow.visible,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(kGreenColor)),
            ),
            child: Text(
              "تسوق الان",
              style: TextStyle(color: Color(0xffC4B399)),
            ),
          ),
        ],
      ),
    );
  }
}
