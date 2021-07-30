import 'package:flutter/material.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/screens/edit_screen.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<Data>(context);
    User user = Provider.of<Auth>(context).user;

    return SingleChildScrollView(
      // physics: ScrollPhysics,
      child: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        user.imageUrl
                        //'https://ichef.bbci.co.uk/news/1024/branded_news/A271/production/_119158514_mediaitem119158513.jpg'
                        ,
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.username
                              // 'Mickale Faraday'
                              ),
                          Text(user.email
                              // 'mickalefaraday@gmail.com'
                              ),
                          SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: TextButton(
                              onPressed: () {
                                Provider.of<Auth>(context, listen: false)
                                    .signOut(context);
                              },
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Dark Mode'),
                      trailing: Switch(
                          value: _provider.isSwitched,
                          onChanged: (val) {
                            _provider.onSwitch(val);
                          }),
                    ),
                    ListTile(
                      leading: Text('Notification'),
                      trailing: Switch(
                          value: _provider.isSwitched,
                          onChanged: (val) {
                            _provider.onSwitch(val);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Account',
                textAlign: TextAlign.start,
              ),
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Edit Account'),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => EditScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_right),
                      ),
                    ),
                    ListTile(
                      leading: Text('Language'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Privacy and Security',
                textAlign: TextAlign.start,
              ),
              width: double.infinity,
            ),
            // Text('Privacy and Security'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Private Account'),
                      trailing: Switch(
                          value: _provider.isSwitched,
                          onChanged: (val) {
                            _provider.onSwitch(val);
                          }),
                    ),
                    ListTile(
                      leading: Text('Privacy and Security Help'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
