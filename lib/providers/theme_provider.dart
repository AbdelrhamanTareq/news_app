import 'package:flutter/cupertino.dart';
import 'package:news_app/helpers/cache_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = CacheHelper.getMode('mode') ?? false;
// CacheHelper.setMode('mode', isDark);
  void changeTheme() {
    isDark = !isDark;
    // isDark = state;
    CacheHelper.setMode('mode', isDark);
    print('state $isDark');
    notifyListeners();
  }
}
