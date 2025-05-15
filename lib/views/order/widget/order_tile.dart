import 'package:angelina/constants.dart';
import 'package:angelina/models/home/order_history_model.dart';
import 'package:angelina/models/home/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderTile extends StatelessWidget {
  final OrderHistoryModel order;
  // final String status;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        trailing: Icon(Icons.assignment_turned_in, size: 7.h),
        leading: Icon(Icons.arrow_drop_down),
        title: Text(
          "التاريخ: ${order.date}",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("عدد المنتجات: ${order.quantity}"),
            Text("الإجمالى : ${order.totalPrice} ر.س"),
          ],
        ),

        textColor: Colors.black,
        iconColor: Color(0xffc6b399),
        collapsedIconColor: kGreenColor,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              // Change overall direction to RTL
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Keep content right-aligned
                children: [
                  Text(
                    "المنتجات:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...order.items.map((item) => OrderItems(item: item)),
                  const SizedBox(height: 8),
                  // Text(
                  //   "Status: $status",
                  //   style: TextStyle(color: kGreenColor, fontSize: 16),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItems extends StatelessWidget {
  final ProductModel item;
  const OrderItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black.withAlpha(25),
              width: 1.5,
            ), // Border color & width
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          leading: SizedBox(
            // height: 30.h,
            width: 15.w,
            child: Image.network(item.images[0].src, fit: BoxFit.fill),
          ),
          title: Text(item.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.price} ر.س",
                style: TextStyle(
                  color: kGreenColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${item.count}x",
                style: TextStyle(
                  color: kGreenColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
