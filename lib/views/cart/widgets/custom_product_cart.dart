import 'package:angelina/constants.dart';
import 'package:angelina/core/utils/widgets/cusrom_add_remove.dart';
import 'package:angelina/core/utils/widgets/custom_favorite_icon.dart';
import 'package:angelina/core/utils/widgets/custom_rating.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/cart/widgets/custom_cart_add_remove.dart';
import 'package:angelina/views/product/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCartProduct extends StatelessWidget {
  const CustomCartProduct({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProductDetailsView(product: product),
          //   ),
          // );
        },

        child: Container(
          // width: 100.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                //blurRadius: 2,
                color: Colors.black.withAlpha(25),
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: SizedBox(
                  width: 57.w,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            text: product.name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff202020),
                              fontWeight: FontWeight.w400,
                            ),
                            children: [WidgetSpan(child: CustomRating())],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${product.price}ر.س",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 25.w,
                              child: CustomCartAddRemove(item: product),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 43.w,
                  // height: 20.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.images[0].src),
                    ),
                  ),
                  //color: kBackgroundColor,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomFavoriteIcon(product: product),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
