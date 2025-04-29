import 'package:angelina/constants.dart';
import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/core/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHomeItem extends StatefulWidget {
  const CustomHomeItem({super.key});

  @override
  State<CustomHomeItem> createState() => _CustomHomeItemState();
}

class _CustomHomeItemState extends State<CustomHomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 40.w,
      height: 50.h,
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
        children: [
          Container(
            height: 22.h,
            // width: 40.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              image: DecorationImage(
                image: AssetImage(Assets.product),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "LANEMAY تونر منعش بفيتامين A – 100 مل",
            textAlign: TextAlign.center,
            style: FontStyles.textStyle10,
          ),
          Text("عناية", textAlign: TextAlign.center),
          Text("ر.س28,00", textAlign: TextAlign.center),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(kGreenColor)),
            ),
            child: Text("تسوق الان", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
