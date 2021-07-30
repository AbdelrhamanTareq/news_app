import 'package:flutter/material.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/providers/data.dart';
import 'package:news_app/providers/screen.dart';
import 'package:news_app/screens/login.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import 'helpers/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final token = CacheHelper.getToken('Token');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Screen(),
          ),
          ChangeNotifierProvider.value(
            value: (token != null) ? (Auth()..getUserData(token)) : Auth(),
          ),
          ChangeNotifierProvider.value(
              value: Data()
                ..getArticles()
                ..getSavedArticles()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Nunito",
            canvasColor: Colors.white,
            primarySwatch: Colors.orange,
            accentColor: Colors.teal,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 10,
              centerTitle: true,
              // color: Theme.of(context).primaryColor,
            ),
            switchTheme: SwitchThemeData(
              // trackColor: MaterialStateColor.resolveWith((states) => Colors.red),
              thumbColor:
                  MaterialStateColor.resolveWith((states) => Colors.orange),
            ),
          ),
          home: (token != null) ? Home() : LoginScreen(),
        ));
  }
}
