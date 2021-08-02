import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

import '../providers/data.dart';

class NewsDetailes extends StatelessWidget {
  final String id;
  const NewsDetailes(this.id);

  @override
  Widget build(BuildContext context) {
    // Article _article = Provider.of<Data>(context).article;
    var _article = Provider.of<Data>(context).getArticle(id);
    // var _article1 = Provider.of<Data>(context).article;

    return Scaffold(
      body: (_article == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          _article.imageUrl,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            _article.isSaved
                                ? Icons.bookmark_add
                                : Icons.bookmark_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Align(
                          // alignment: Alignment.center,
                          child: Text(
                            DateFormat('yyyy/MM/dd').format(
                              DateTime.parse(_article.publishedAt),
                            ),
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25.0,
                      horizontal: 15.0,
                    ),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Theme.of(context).primaryColor,
                            thickness: 2.0,
                          ),
                          Expanded(
                            child: Text(_article.title,
                                style: Theme.of(context).textTheme.headline4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(_article.description,
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _article.content,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
