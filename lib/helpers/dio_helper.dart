import 'package:dio/dio.dart';
// import 'package:news_app/models/article.dart';

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio();
  }

  static Future<Response> getData(String url) async {
    return await dio.get(url);
  }

  static Future<Response> putData(String url, Map data) async {
    return await dio.put(url, data: data);
  }

  static Future<Response> postData(
      String url, Map<String, dynamic> data) async {
    return await dio.post(url, data: data);
  }
  // final _baseUrl = 'https://60d6c109307c300017a5f49a.mockapi.io/api/v1';

//   Future getData(String endPoint) async {
//     Article article;
//     try {
//       final response = await _dio.get(_baseUrl + '/$endPoint');
//       print('Data: ${response.data}');
//       article = Article.fromJson(response.data);
//     } on DioError catch (e) {
//       // The request was made and the server responded with a status code
//       // that falls out of the range of 2xx and is also not 304.
//       if (e.response != null) {
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         // Error due to setting up or sending the request
//         print('Error sending request!');
//         print(e.message);
//       }
//     }
//     return article;
//   }
// }
}

// class DioClient {
//   final Dio _dio = Dio();

//   final _baseUrl = 'https://reqres.in/api';

//   // TODO: Add methods
//   Future getUser({String id}) async {
//     // Perform GET request to the endpoint "/users/<id>"
//     Response userData = await _dio.get(_baseUrl + '/users/$id');

//     // Prints the raw data returned by the server
//     print('User Info: ${userData.data}');

//     // Parsing the raw JSON data to the User class
//     Article user = Article.fromJson(userData.data);

//     return user;
//   }
// }
