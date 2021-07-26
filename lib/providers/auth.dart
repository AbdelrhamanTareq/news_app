import 'package:flutter/foundation.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/shared/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  // SharedPreferences _sharedPreferences;

  String token;
  void login(String email, String password) {
    DioHelper.getData(
            'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users?email=$email&password=$password')
        .then((value) {
      var jsonRespones = value.data;
      for (var x in jsonRespones) {
        User user = User.fromJson(x);
        CacheHelper.setToken('Token', user.token);
        print('user ${user.token}');
        token = user.token;
        notifyListeners();
      }

      print(value);
      notifyListeners();
    }).catchError((error) => print(error.toString()));
  }

  // void saveToken(String key, String value) async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   await _sharedPreferences.setString(key, value);
  //   notifyListeners();
  // }

  // getToken(String key) async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   notifyListeners();
  //   return _sharedPreferences.getString(key);
  // }

  // deletToken() async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   _sharedPreferences.clear();
  //   notifyListeners();
  // }
}

// https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users?email=Willis7@yahoo.com&password=gLheU0AUvJH9OU2
