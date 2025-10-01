import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static Future<void> saveFavorites(String key, List<String> ids) async {
    await _instance.setStringList(key, ids);
  }

  static List<String> getFavorites(String key) {
    return _instance.getStringList(key) ?? [];
  }

  static Future<void> addFavorite(String key, String id) async {
    final current = getFavorites(key);
    if (!current.contains(id)) {
      current.add(id);
      await saveFavorites(key, current);
    }
  }

  static Future<void> removeFavorite(String key, String id) async {
    final current = getFavorites(key);
    if (current.contains(id)) {
      current.remove(id);
      await saveFavorites(key, current);
    }
  }

  static Future<void> clearFavorites(String key) async {
    await _instance.remove(key);
  }

  static getString(String key) {
    return _instance.getString(key);
  }

  static Future<bool> clear() async {
    return await _instance.clear();
  }
}
