import 'package:angelina/models/home/product_model.dart';

class OrderHistoryModel {
  final String date;
  final String quantity;
  final double totalPrice;
  final List<ProductModel> items;

  OrderHistoryModel({
    required this.date,
    required this.quantity,
    required this.totalPrice,
    required this.items,
  });

  // Convert OrderHistoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'items': items.map((item) => item.toJson()).toList(), // Convert ProductModel list to JSON
    };
  }

  // Create OrderHistoryModel from JSON
  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      date: json['date'] as String,
      quantity: json['quantity'] as String,
      totalPrice: json['totalPrice'] as double,
      items: (json['items'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(), // Convert JSON list back to ProductModel list
    );
  }
}
