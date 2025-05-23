import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/widgets/custom_home_item.dart';
import 'package:angelina/views/product/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHomeGrid extends StatefulWidget {
  const CustomHomeGrid({
    super.key,
    required this.products,
    this.scroll = false,
  });
  final List<ProductModel> products;
  final bool scroll;
  @override
  State<CustomHomeGrid> createState() => _CustomHomeGridState();
}

class _CustomHomeGridState extends State<CustomHomeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          widget.scroll
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 41.5.h,
        //childAspectRatio: 0.51.w / 0.486.h,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        ProductDetailsView(product: widget.products[index]),
              ),
            );
          },
          child: CustomHomeItem(product: widget.products[index]),
        );
      },
    );
  }
}
