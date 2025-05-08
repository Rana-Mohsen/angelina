import 'dart:convert';
import 'package:angelina/models/home/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorageService {
  static const String _favKey = 'fav_items';

  static Future<void> saveFavorites(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(products.map((p) => p.toJson()).toList());
    await prefs.setString(_favKey, encoded);
  }

  static Future<List<ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_favKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favKey);
  }

  // ===== ADD A SINGLE PRODUCT TO FAVORITES =====
  static Future<void> addFavorite(ProductModel product) async {
    List<ProductModel> favorites = await loadFavorites();

    // Check if product already exists to avoid duplicates
    if (!favorites.any((item) => item.id == product.id)) {
      product.isFav = true;
      print("===> ${product.isFav}");
      favorites.add(product);
      await saveFavorites(favorites);
    }
  }

  // ===== REMOVE A SINGLE PRODUCT FROM FAVORITES =====
  static Future<void> removeFavorite(int productId) async {
    List<ProductModel> favorites = await loadFavorites();
    favorites.removeWhere((item) => item.id == productId);
    await saveFavorites(favorites);
  }
}
