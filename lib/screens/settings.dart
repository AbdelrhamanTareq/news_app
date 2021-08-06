import 'package:flutter/material.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/providers/theme_provider.dart';
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
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).canvasColor,
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
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: [
                    buildSwitchListTile(context, 'Dark mode'),
                    buildSwitchListTile(context, 'Notification'),
                  ],
                ),
              ),
            ),
            buildHeading('Account', context),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: [
                    buildIconListTile(context, 'Edit Profile', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => EditScreen(),
                        ),
                      );
                    }),
                    buildIconListTile(context, 'Language', () {}),
                  ],
                ),
              ),
            ),
            buildHeading('Privacy and Security', context),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Theme.of(context).canvasColor,
                child: Column(
                  children: [
                    buildSwitchListTile(context, 'Private Account'),
                    buildSwitchListTile(context, 'Privacy and Security Help'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildIconListTile(
      BuildContext context, String text, Function function) {
    return ListTile(
      leading: Text(text,
          style: TextStyle(
            color: Theme.of(context).dividerColor,
          )),
      trailing: IconButton(
        onPressed: function
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (ctx) => EditScreen(),
        //   ),
        // );
        ,
        icon: Icon(
          Icons.arrow_right,
          color: Theme.of(context).iconTheme.copyWith(color: Colors.grey).color,
        ),
      ),
    );
  }

  Container buildHeading(String text, context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).dividerColor,
        ),
        textAlign: TextAlign.start,
      ),
      width: double.infinity,
    );
  }

  ListTile buildSwitchListTile(BuildContext context, String text) {
    return ListTile(
      leading: Text(
        text,
        style: TextStyle(color: Theme.of(context).dividerColor),
      ),
      trailing: Switch(
          value: (Provider.of<ThemeProvider>(context).isDark),
          // CacheHelper.getMode('mode'),
          onChanged: (state) {
            Provider.of<ThemeProvider>(context, listen: false).changeTheme();
          }),
    );
  }
}
