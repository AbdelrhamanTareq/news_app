import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  //------------------ Main Theme ---------------------
  fontFamily: "Nunito",
  canvasColor: Colors.white,
  brightness: Brightness.light,
  primarySwatch: Colors.orange,
  primaryColor: Colors.orange,
  accentColor: Colors.teal,
  cardColor: Colors.grey[50],
  dividerColor: Colors.black,
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
    subtitle1: TextStyle(
      color: Colors.grey,
      fontSize: 18,
    ),
  ),
  //------------------ Appbar Theme ---------------------
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 10,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    // color: Theme.of(context).primaryColor,
  ),
  //------------------ Navigation bar Theme ---------------------
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 15,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.black,
  ),
  //------------------ Icon Theme ---------------------
  iconTheme: IconThemeData(
    color: Colors.orange,
  ),

  switchTheme: SwitchThemeData(
    trackColor: MaterialStateColor.resolveWith((states) => Colors.orange),
    thumbColor: MaterialStateColor.resolveWith((states) => Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  //------------------ Main Theme ---------------------
  fontFamily: "Nunito",
  canvasColor: Colors.black,
  brightness: Brightness.dark,
  primarySwatch: Colors.orange,
  primaryColor: Colors.orange,
  accentColor: Colors.teal,
  cardColor: Colors.grey[850],
  dividerColor: Colors.white,
  //------------------ Text Theme ---------------------
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17,
      color: Colors.white,
    ),
    bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
    headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    caption: TextStyle(color: Colors.white, fontSize: 14),
  ),
  //------------------ Appbar Theme ---------------------
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 10,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    // color: Theme.of(context).primaryColor,
  ),
  //------------------ Navigation bar Theme ---------------------
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black),
  //------------------ Icon Theme ---------------------
  iconTheme: IconThemeData(
    color: Colors.orange,
  ),

  switchTheme: SwitchThemeData(
    trackColor: MaterialStateColor.resolveWith((states) => Colors.grey),
    thumbColor: MaterialStateColor.resolveWith((states) => Colors.orange),
  ),
);
