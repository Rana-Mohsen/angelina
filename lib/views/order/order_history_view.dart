import 'package:flutter/material.dart';
import 'package:angelina/core/services/local_storage/order_history_service.dart';
import 'package:angelina/models/home/order_history_model.dart';
import 'package:angelina/views/order/widget/order_tile.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  // Future<List<OrderHistoryModel>> _fetchOrders() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الطلبات السابقة")),
      body: FutureBuilder<List<OrderHistoryModel>>(
        future: OrderHistoryService.loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading orders"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("لا يوجد طلبات سابقة"));
          }

          final orders = snapshot.data!;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) => OrderTile(order: orders[index]),
          );
        },
      ),
    );
  }
}
