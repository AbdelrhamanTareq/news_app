import 'package:flutter/material.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/providers/data.dart';
import 'package:news_app/providers/screen.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/login.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/shared/app_theme.dart';
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
  // final mode = CacheHelper.getMode('mode') ?? false;

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
        builder: (ctx, theme, _) {
          // print('mode ${mode}');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: (theme.isDark) ? darkTheme : lightTheme,
            darkTheme: darkTheme,
            home: (token != null) ? Home() : LoginScreen(),
          );
        },
      ),
    );
  }
}
