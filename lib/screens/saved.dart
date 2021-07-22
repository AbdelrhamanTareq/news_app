import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/shared/components.dart';
import 'package:provider/provider.dart';

import '../models/article.dart';
import '../providers/data.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<Data>(context).savedArticles);
    return buildList(Provider.of<Data>(context).savedArticles, context);
  }

  Widget buildList(List<Article> savedArticle, context) {
    if (savedArticle.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
          itemBuilder: (ctx, i) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      navToPage(ctx, savedArticle[i].id);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 135,
                          child: Image(
                            image: NetworkImage(savedArticle[i].imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  savedArticle[i].title,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.timer),
                                    Text(
                                      // '4hr'
                                      DateFormat('yyyy/MM/dd').format(
                                        DateTime.parse(
                                            savedArticle[i].publishedAt),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        icon: Icon(
                                          savedArticle[i].isSaved
                                              ? Icons.bookmark_add
                                              : Icons.bookmark_border_outlined,
                                        ),
                                        color: savedArticle[i].isSaved
                                            ? Theme.of(context).primaryColor
                                            : Colors.black,
                                        onPressed: () {
                                          Provider.of<Data>(context,
                                                  listen: false)
                                              .saveArticle(savedArticle[i].id,
                                                  i: i);
                                        })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          separatorBuilder: (ctx, i) => Divider(),
          itemCount: savedArticle.length),
    );
  }
}
