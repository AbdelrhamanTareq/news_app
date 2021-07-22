import 'package:flutter/material.dart';

import '../helpers/dio_helper.dart';
import '../models/article.dart';

class Data with ChangeNotifier {
  List<Article> articles = [];
  List<Article> searchArticles = [];
  List<Article> savedArticles = [];
  Article article;
  bool isSwitched = false;
  void onSwitch(bool val) {
    isSwitched = val;
    notifyListeners();
  }

  // bool isSave = false;

  getArticles() async {
    try {
      final response = await DioHelper.getData(
          'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/article');

      if (response.statusCode == 200) {
        var jsonRespones = response.data;
        for (var x in jsonRespones) {
          articles.add(Article.fromJson(x));

          notifyListeners();
        }
        notifyListeners();
        return articles;
      }
      //  else {
      //   notifyListeners();
      //   throw Exception('Failed to load data');
      // }
    } catch (error) {
      print(error.toString());
    }
  }

  getSearchData(String search) async {
    searchArticles = [];

    final response = await DioHelper.getData(
        'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/article?title=$search');

    if (response.statusCode == 200) {
      var jsonRespones = response.data;
      for (var x in jsonRespones) {
        searchArticles.add(Article.fromJson(x));

        print(searchArticles[0].title);
      }
      if (searchArticles.isNotEmpty) {}

      notifyListeners();
      return searchArticles;
    } else {
      notifyListeners();

      throw Exception('Failed to load data');
    }
  }

  saveArticle(String id, {int i}) async {
    final response = await DioHelper.putData(
        'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/article/$id', {
      'isSaved': !articles[i].isSaved,
    });
    if (response.statusCode == 200) {
      print('ok');
      // isSave = true;
      await getArticles();
      await getArticles();
      notifyListeners();
    } else {
      print('error');
      // isSave = false;
      notifyListeners();
    }
  }

  getSavedArticles() async {
    try {
      final response = await DioHelper.getData(
          'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/article?isSaved=true');

      if (response.statusCode == 200) {
        var jsonRespones = response.data;
        for (var x in jsonRespones) {
          savedArticles.add(Article.fromJson(x));
          // print(savedArticles[0].author);
          notifyListeners();
        }
        print('ddd ${savedArticles[0].author}');
        notifyListeners();
        return savedArticles;
      } else {
        notifyListeners();
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  // getArticle(int id) async {
  //   try {
  //     final response = await DioHelper.getData(
  //         'https://60d6c109307c300017a5f49a.mockapi.io/api/v1/article/$id');

  //     if (response.statusCode == 200) {
  //       article = Article.fromJson(response.data);
  //       notifyListeners();
  //       return article;
  //     }
  //     //  else {
  //     //   notifyListeners();
  //     //   throw Exception('Failed to load data');
  //     // }
  //   } catch (error) {
  //     print(error.toString());
  //   }
  //   notifyListeners();
  //   return article;
  // }
  Article getArticle(String id) {
    return articles.firstWhere((article) => article.id == id);
  }
}
