import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, });
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final List<int> _colorList = const [0xff9D9484, 0xffFFB573, 0xff355B5E];
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10.h,
            child: SizedBox(
              width: 100.w,
              height: 45.h,
              child: Row(
                children: [
                
                  // const Flexible(child: FittedBox(child: ImageView())),
                ],
              ),
            ),
          ),
          // Positioned(top: 5.h, child: HomeAppBar(item: widget.item)),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: ItemDetails(item: widget.item),
          // ),
         
        ],
      ),
    );
  }
} 