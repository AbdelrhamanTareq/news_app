import 'package:flutter/material.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/providers/data.dart';
import 'package:news_app/providers/screen.dart';
import 'package:news_app/providers/theme_provider.dart';
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
  final ThemeData lightTheme = ThemeData(
    //------------------ Main Theme ---------------------
    fontFamily: "Nunito",
    canvasColor: Colors.white,
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
    primaryColor: Colors.orange,
    accentColor: Colors.teal,
    //------------------ Text Theme ---------------------
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 17,
        color: Colors.black,
      ),
      bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
      headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
      caption: TextStyle(color: Colors.black, fontSize: 14),
    ),
    //------------------ Appbar Theme ---------------------
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 10,
      centerTitle: true,
      // color: Theme.of(context).primaryColor,
    ),
    //------------------ Navigation bar Theme ---------------------
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.orange,
    ),
    //------------------ Icon Theme ---------------------
    iconTheme: IconThemeData(
      color: Colors.orange,
    ),

    switchTheme: SwitchThemeData(
      // trackColor: MaterialStateColor.resolveWith((states) => Colors.red),
      thumbColor: MaterialStateColor.resolveWith((states) => Colors.orange),
    ),
  );
  final ThemeData darkTheme = ThemeData(
    fontFamily: "Nunito",
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
    primaryColor: Colors.orange,
    accentColor: Colors.teal,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.orange,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: Colors.blue,
    //   elevation: 15,
    // ),
    // iconTheme: IconThemeData(
    //   color: Colors.orange,
    //   // Theme.of(context).primaryColor,
    // ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: Colors.blue,
    //   elevation: 15,
    // ),
    // bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 10,
      centerTitle: true,
      // color: Theme.of(context).primaryColor,
    ),
    switchTheme: SwitchThemeData(
      // trackColor: MaterialStateColor.resolveWith((states) => Colors.red),
      thumbColor: MaterialStateColor.resolveWith((states) => Colors.orange),
    ),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Screen(),
          ),
          ChangeNotifierProvider.value(
            value: ThemeProvider(),
          ),
          ChangeNotifierProvider.value(
            value: (token != null) ? (Auth()..getUserData(token)) : Auth(),
          ),
          ChangeNotifierProvider.value(
              value: Data()
                ..getArticles()
                ..getSavedArticles()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (ctx, thmem, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                //  thmem.isLight

                //  ?
                lightTheme
            //  : darkTheme,
            // darkTheme: darkTheme,
            ,
            darkTheme: darkTheme,
            home: (token != null) ? Home() : LoginScreen(),
          ),
        ));
  }
}
