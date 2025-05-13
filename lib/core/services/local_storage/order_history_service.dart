import 'dart:convert';
import 'package:angelina/models/home/order_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryService {
  static const String _orderKey = 'order_items';

  static Future<void> saveOrder(List<OrderHistoryModel> order) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(order.map((p) => p.toJson()).toList());
    await prefs.setString(_orderKey, encoded);
  }

  static Future<List<OrderHistoryModel>> loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_orderKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => OrderHistoryModel.fromJson(e)).toList();
  }

  static Future<void> addOrder(OrderHistoryModel order) async {
    List<OrderHistoryModel> orders = await loadOrders();

    orders.add(order);
      await saveOrder(orders);
  }

}
