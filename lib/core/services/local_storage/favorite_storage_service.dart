import 'dart:convert';
import 'package:angelina/models/home/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorageService {
  static const String _favKey = 'fav_items';

  static Future<void> saveFavorites(Map<int, ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(products.map((key, value) => MapEntry(key.toString(), value.toJson())));
    await prefs.setString(_favKey, encoded);
  }

  static Future<Map<int, ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_favKey);
    if (data == null) return {};
    final decoded = jsonDecode(data) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(int.parse(key), ProductModel.fromJson(value)));
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favKey);
  }

  // ===== ADD A SINGLE PRODUCT TO FAVORITES =====
  static Future<void> addFavorite(ProductModel product) async {
    Map<int, ProductModel> favorites = await loadFavorites();

    // Check if product already exists to avoid duplicates
    if (!favorites.containsKey(product.id)) {
      product.isFav = true;
      favorites[product.id] = product;
      await saveFavorites(favorites);
    }
  }

  // ===== REMOVE A SINGLE PRODUCT FROM FAVORITES =====
  static Future<void> removeFavorite(int productId) async {
    Map<int, ProductModel> favorites = await loadFavorites();
    favorites.remove(productId);
    await saveFavorites(favorites);
  }
}
