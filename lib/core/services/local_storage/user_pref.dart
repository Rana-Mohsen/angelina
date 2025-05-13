import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _nameKey = 'user_name';
  static const String _emailKey = 'user_email';
  static const String _imageKey = 'user_image';

  // ====== SAVE FUNCTIONS ======
  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }

  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
  }

  static Future<void> saveImagePath(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, imagePath);
  }

  // ====== LOAD FUNCTIONS ======
  static Future<String?> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  static Future<String?> loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  static Future<String?> loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageKey);
  }

  // ====== CLEAR FUNCTIONS ======
  static Future<void> clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
  }

  static Future<void> clearEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
  }

  static Future<void> clearImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_imageKey);
  }

  static Future<void> clearAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_imageKey);
  }
}
