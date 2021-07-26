import 'package:flutter/material.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/providers/screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 50,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/250?image=9'),
                  ),
                  SizedBox(width: 25),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          'Abdelrhman Tarek',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Text('01152986000'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          buildListTile(Icons.home, 'Home', context, 0),
          buildListTile(Icons.search, 'Search', context, 1),
          buildListTile(Icons.bookmark, 'Saved', context, 2),
          buildListTile(Icons.settings, 'Settings', context, 3),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: Text(
                    'Sign out',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // Provider.of<Auth>(context, listen: false).deletToken();
                    CacheHelper.deleteToken('Token');
                    print('ghghjghj');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildListTile(IconData icon, String text, context, int index) {
    return InkWell(
      onTap: () {
        Provider.of<Screen>(context, listen: false).onTabTapped(index);
        Navigator.pop(context);
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(text),
      ),
    );
  }
}
