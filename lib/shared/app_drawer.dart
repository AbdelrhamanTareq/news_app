import 'package:flutter/material.dart';

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
                      Text(
                        'Ahmed',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('01152986000'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          buildListTile(Icons.home, 'Home'),
          buildListTile(Icons.search, 'Search'),
          buildListTile(Icons.bookmark, 'Saved'),
          buildListTile(Icons.settings, 'Settings'),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: Text('Sign out'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildListTile(IconData icon, String text) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }
}
