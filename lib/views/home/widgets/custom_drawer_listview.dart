import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerListviewImage extends StatelessWidget {
  const DrawerListviewImage({super.key, required this.image, required this.view});
  final String image;
  final Widget view;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          // BlocProvider.of<DrawerImageCubit>(context).showCard(view);
        },
        child: SizedBox(
          height: 28.5.h,
          child: Image.asset(image),
        ),
      ),
    );
  }
}