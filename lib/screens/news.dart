import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/article.dart';
import '../shared/components.dart';
import '../providers/data.dart';
// import '../models/article.dart';

// https://www.behance.net/gallery/101782941/News-App-Design

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context, 'Stories', 8, 30, Theme.of(context).primaryColor),
        Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: buildSlider(Provider.of<Data>(context).articles),
          ),
        ),
        buildText(context, 'Headlines', 8, 30, Theme.of(context).primaryColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child:
                (buildNewsList(Provider.of<Data>(context).articles, context)),
          ),
        )
      ],
    );
  }

  Widget buildNewsList(List<Article> articleModel, context) {
    if (articleModel.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.separated(
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          navToPage(ctx, articleModel[i].id);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (ctx) => NewsDetailes(articleModel[i].id),
          //   ),
          // );
        },
        child: Row(
          children: [
            Container(
              height: 100,
              width: 135,
              child: Image(
                image: NetworkImage(articleModel[i].imageUrl),
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
                    Text(articleModel[i].title,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1
                        // TextStyle(
                        //   // color: Colors.black,
                        //   // fontWeight: FontWeight.w700,
                        //   // fontSize: 17,
                        // ),
                        ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Theme.of(context)
                              .iconTheme
                              .copyWith(color: Colors.grey)
                              .color,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          DateFormat('yyyy/MM/dd').format(
                            DateTime.parse(
                              articleModel[i].publishedAt,
                            ),
                          ),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(
                              articleModel[i].isSaved
                                  ? Icons.bookmark_add
                                  : Icons.bookmark_border_outlined,
                            ),
                            color: articleModel[i].isSaved
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                            onPressed: () async {
                              Provider.of<Data>(context, listen: false)
                                  .saveArticle(articleModel[i].id, i: i);
                              // await Provider.of<Data>(context, listen: false)
                              //     .getArticles();
                            })
                        // color: Colors.white,
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (ctx, i) => Divider(),
      itemCount: articleModel.length,
    );
  }

  Widget buildSlider(List<Article> articleModel) {
    if (articleModel.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, i, _) => InkWell(
        onTap: () {
          navToPage(context, articleModel[i].id);
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  articleModel[i].imageUrl
                  // 'https://ichef.bbci.co.uk/news/1024/branded_news/A271/production/_119158514_mediaitem119158513.jpg'
                  ,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                child: Container(
                  width: 250,
                  // height: 70,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    articleModel[i].title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
            )
          ],
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        viewportFraction: 1.0,
        initialPage: 0,
        height: 200,
        // enlargeCenterPage: true,
      ),
    );
  }
}
