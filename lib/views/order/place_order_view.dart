import 'package:angelina/views/order/widget/place_order_view_body.dart';
import 'package:flutter/material.dart';

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        //onTapBackIcon: () => context.pop(),
      ),
      body: const PlaceOrderViewBody(),
    );
  }
}
