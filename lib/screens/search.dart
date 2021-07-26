import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/article.dart';
import '../providers/data.dart';
import '../shared/components.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isTimer = false;
  bool isSearch = false;

  getData(String val, context) async {
    if (_validate()) {
      await Provider.of<Data>(context, listen: false).getSearchData(val);
    }
  }

  final TextEditingController _searchController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validate() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('validate');
      return true;
    } else {
      print('not valdiate');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('bool is ${Provider.of<Data>(context).searchArticles}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        buildText(context, 'Discover', 0, 30, Theme.of(context).primaryColor),
        buildText(context, 'News from all the world', 0, 14, Colors.grey),
        SizedBox(
          height: 25,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (val) {
                  if (val.isEmpty || val == null) {
                    return 'Search can\'t be empty';
                  }
                  return null;
                },
                onFieldSubmitted: (val) {
                  _searchController.text = val;
                  print('tap');
                  if (_validate()) {
                    setState(() {
                      isSearch = true;
                    });
                    Provider.of<Data>(context, listen: false)
                        .getSearchData(val);
                    // Timer(Duration(milliseconds: 1000), () {
                    //   setState(() {
                    //     isTimer = true;
                    //   });
                    // });
                  }

                  return;
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.dashboard_customize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        (isSearch)
            ? buildSearchList(Provider.of<Data>(context).searchArticles)
            : Center(
                child: Text('No data searched'),
              ),
      ],
    );
  }

  Widget buildSearchList(List<Article> searchArticle) {
    if (searchArticle.isEmpty) {
      // Timer(Duration(milliseconds: 1500), () {
      //   setState(() {
      //     isTimer = true;
      //   });
      // });
      return Center(
        child: (searchArticle.isEmpty && isTimer)
            ? Text('No data found')
            : CircularProgressIndicator(),
      );
    } else {
      // Provider.of<Data>(context).isLoading = false;
      setState(() {
        isSearch = false;
        isTimer = false;
      });
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: searchArticle.length,
          itemBuilder: (ctx, i) => InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 135,
                  child: Image(
                    image: NetworkImage(searchArticle[i].imageUrl),
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
                          searchArticle[i].title,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer),
                            Text(
                              // '4hr'
                              DateFormat('yyyy/MM/dd').format(
                                DateTime.parse(searchArticle[i].publishedAt),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.bookmark_border_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (ctx, i) => Divider(),
        ),
      ));
    }
  }
}
