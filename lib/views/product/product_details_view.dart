import 'dart:ui' as ui;

import 'package:angelina/constants.dart';
import 'package:angelina/core/utils/assets.dart';
import 'package:angelina/core/widgets/cusrom_add_remove.dart';
import 'package:angelina/core/widgets/custom_button.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:angelina/views/home/widgets/custom_drawer_header.dart';
import 'package:angelina/views/product/widgets/custom_app_bar.dart';
import 'package:angelina/views/product/widgets/custom_dropdown.dart';
import 'package:angelina/views/product/widgets/custom_product_slider.dart';
import 'package:angelina/core/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';
import 'package:html/parser.dart' as html;

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  String decodeDiscription() {
    var description = widget.product.description;
    var document = html.parse(description); // Parse HTML content
    var tableRows = document.querySelectorAll('tr'); // Find table rows

    String result = tableRows
        .map((row) {
          var cells = row.querySelectorAll('td');
          return cells.length > 1
              ? '${cells[0].text}: ${cells[1].text}'
              : ''; // Ensure correct indexing
        })
        .where((text) => text.isNotEmpty)
        .join(', '); // Remove empty values

    return result;
  }

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
                  Positioned(
                    top: 1.h,
                    child: CustomAppBar(product: widget.product),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
              height: 43.3.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                        height: 4.3.h,
                        child: CustomDropDown(
                          attributes: widget.product.attributes,
                        ),
                      ),
                      SizedBox(
                        width: 43.w,
                        height: 4.h,
                        child: CustomAddRemove(item: widget.product),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Text("وصف المنتج", textDirection: TextDirection.rtl),
                  Flexible(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SizedBox(
                        // height: 15.h,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text(
                              decodeDiscription(),
                              style: TextStyle(color: Color(0xff939393)),
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        SizedBox(
                          width: 55.w,
                          child: CustomButton(
                            text: "اضافة الى السلة",
                            onTap: () {
                              
                            },
                          ),
                        ),
                        Text(
                          "${widget.product.price}ر.س",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kGreenColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
