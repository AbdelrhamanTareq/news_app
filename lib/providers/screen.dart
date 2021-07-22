import 'package:flutter/material.dart';

import '../screens/saved.dart';
import '../screens/news.dart';
import '../screens/search.dart';
import '../screens/settings.dart';

class Screen with ChangeNotifier {
  int currentIndex = 0;
  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void navToSearch() {
    currentIndex = 1;
    print(currentIndex);
    notifyListeners();
  }

  final List<Widget> children = [
    News(),
    Search(),
    Saved(),
    Settings(),
  ];
}
