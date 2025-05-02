import 'package:angelina/constants.dart';
import 'package:angelina/models/home/slider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSliderItem extends StatelessWidget {
  const CustomSliderItem({super.key, required this.item});
  final SliderItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        spacing: .5.h,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 5.w,
              color: const Color(0xff242424),
              // overflow: TextOverflow.visible,
            ),
          ),
          SizedBox(
            height: 3.3.h,
            // width: 25.w,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                ),
                //fixedSize: WidgetStateProperty.all(Size(20.w, 1.h)),
                backgroundColor: WidgetStatePropertyAll(kGreenColor),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "تسوق الان",
                  style: TextStyle(color: Color(0xffC4B399)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
