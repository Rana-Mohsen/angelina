import 'package:angelina/constants.dart';
import 'package:angelina/core/services/local_storage/order_history_service.dart';
import 'package:angelina/models/home/order_history_model.dart';
import 'package:angelina/models/order_requist_model.dart';
import 'package:angelina/core/services/api_service/api.dart';
import 'package:angelina/core/services/api_service/order_api.dart';
import 'package:angelina/views/cart/view_model/cart_list/cart_list_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;
  final OrderRequest order;
  const PaymentWebView({
    super.key,
    required this.paymentUrl,
    required this.order,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController controller;
  final OrderApi _order = OrderApi(Api(Dio()));
  @override
  void initState() {
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) async {
                if (url.contains("success")) {
                  _addToOrderHistory();
                  cartList = [];
                  BlocProvider.of<CartListCubit>(context).emptyCart();
                  await _order.sendOrder(widget.order);
                  Navigator.pop(context);
                  // Navigator.pop(context);

                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CustomNavigationBar()),
                  // );
                }
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  _addToOrderHistory() async {
    double total = BlocProvider.of<CartListCubit>(context).totalPrice;
    String formattedDate = DateTime.now().toLocal().toString().split(' ')[0];
    OrderHistoryModel order = OrderHistoryModel(
      date: formattedDate,
      quantity: cartList.length.toString(),
      totalPrice: total,
      items: cartList,
    );
    await OrderHistoryService.addOrder(order);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيانات الدفع"),
        automaticallyImplyLeading: false,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
