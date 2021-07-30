import 'package:flutter/material.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/shared/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user;
    final provider = Provider.of<Screen>(context);
    print('user ${user}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              provider.navToSearch();
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          provider.onTabTapped(index);
          print(index);
          print(provider.currentIndex);
        },
        currentIndex: (provider.currentIndex),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: provider.children[provider.currentIndex],
    );
  }
}
