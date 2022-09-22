import 'dart:math';

import 'package:dio/dio.dart';
// import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  User user;
  // var data;
  var _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890-';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String token;
  // login(String email, String password) async {
  //   try {
  //     final response = await DioHelper.getData(
  //         'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users?email=$email&password=$password');

  //     if (response.statusCode == 200) {
  //       var jsonRespones = response.data;
  //       data = jsonRespones;
  //       print('data = ${jsonRespones}');
  //       print('data1 = ${data}');
  //       user = User.fromJson(jsonRespones[0]);
  //       print('user = ${user.email}');
  //       // for (var x in jsonRespones) {
  //       //   articles.add(Article.fromJson(x));

  //       //   notifyListeners();
  //       // }
  //       notifyListeners();
  //       return user;
  //     }
  //     //  else {
  //     //   notifyListeners();
  //     //   throw Exception('Failed to load data');
  //     // }
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  Future<User> login(String email, String password) async {
    // User user;
    try {
      Response response = await DioHelper.getData(
          'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users?email=$email&password=$password');
      print('User Info: ${response.data}');
      if (response.data.length != 0) {
        user = User.fromJson(response.data[0]);
        CacheHelper.setToken('id', user.id);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  Future<User> getUserData(String token) async {
    // User user;
    try {
      Response response = await DioHelper.getData(
          'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users?token=$token');
      print('User Info: ${response.data}');
      user = User.fromJson(response.data[0]);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    notifyListeners();
    return user;
  }

  Future<void> register(String email, String password) async {
    await DioHelper.postData(
        'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users', {
      'email': email,
      'password': password,
      'token': getRandomString(36),
      'username': 'username',
      'imageUrl': '',
      'phone': '012345678910',
    }).then((value) {
      user = User.fromJson(value.data);
      notifyListeners();
      print(user.email);
      print(user.token);
      notifyListeners();
      return user;
      // CacheHelper.setToken('Token', user.token);
    }).catchError((error) {
      notifyListeners();
      print(error);
    });
  }

  void signOut(context) {
    CacheHelper.deleteToken('Token').then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (contex) => LoginScreen(),
        ),
      ),
    );
  }

  updateUserData(
    // String token1,
    String username,
    String phone,
    String imageUrl,
    // Map<String, dynamic> data
  ) async {
    var id = CacheHelper.getToken('id');
    // var token1 = CacheHelper.getToken('Token');
    try {
      Response response = await DioHelper.putData(
        'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/users/$id',
        {
          'username': username,
          'phone': phone,
          'imageUrl': imageUrl,
        },
      );
      print('User update: ${response.data}');
      user = User.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response.statusCode}');
        print('DATA: ${e.response.data}');
        print('HEADERS: ${e.response.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    notifyListeners();
    return user;
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
//40b638e1-06ed-434f-baf4-6cce531ec907