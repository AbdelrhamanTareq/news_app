import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  static String getToken(
    String key,
  ) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> deleteToken(String key) {
    return sharedPreferences.remove(key);
  }

  static Future<bool> setMode(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getMode(
    String key,
  ) {
    return sharedPreferences.getBool(key);
  }
}
