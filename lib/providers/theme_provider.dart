import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;

  void changeTheme(bool state) {
    isLight = state;
    notifyListeners();
  }
}
