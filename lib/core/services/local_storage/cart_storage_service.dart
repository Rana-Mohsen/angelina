import 'dart:convert';
import 'package:angelina/models/home/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartStorageService {
  static const String _cartKey = 'cart_items';

  static Future<void> saveCartItems(List<ProductModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, encoded);
  }

  static Future<List<ProductModel>> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cartKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
