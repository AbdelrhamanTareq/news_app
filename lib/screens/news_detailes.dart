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
                          // IconButton(
                          //   onPressed: () {
                          //     Provider.of<Data>(context, listen: false)
                          //         .saveArticle(
                          //       _article.id,
                          //     );
                          //   },
                          //   icon: Icon(
                          //     _article.isSaved
                          //         ? Icons.bookmark_add
                          //         : Icons.bookmark_border_outlined,
                          //   ),
                          //   color: Colors.white,
                          // ),
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
                            child: Text(
                              _article.title,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 200,
                  //   // width: double.infinity,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(20),
                  //     child: Row(
                  //       children: [
                  //         VerticalDivider(
                  //           color: Theme.of(context).primaryColor,
                  //           thickness: 2.0,
                  //         ),
                  //         Container(
                  //           height: 100,
                  //           width: double.infinity,
                  //           child: Text(
                  //             _article1.title,
                  //             style: TextStyle(
                  //               fontSize: 35,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _article.description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _article.content,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
  // return FutureBuilder(builder: (ctx, snapshot) {
  //   if (!snapshot.hasData) {
  //     return CircularProgressIndicator();
  //   }
  //   return Scaffold(
  //     body: Container(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             Stack(
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20),
  //                     topRight: Radius.circular(20),
  //                   ),
  //                   child: Image.network(
  //                     snapshot.data.imageUrl,
  //                     fit: BoxFit.cover,
  //                     width: double.infinity,
  //                     height: MediaQuery.of(context).size.height / 2.5,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 20),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: IconButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       icon: Icon(Icons.arrow_back_ios),
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 20),
  //                   child: Align(
  //                     alignment: Alignment.topRight,
  //                     child: IconButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       icon: Icon(
  //                         snapshot.data.isSaved
  //                             ? Icons.bookmark_add
  //                             : Icons.bookmark_border_outlined,
  //                       ),
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.bottomLeft,
  //                   child: Text(
  //                     DateFormat('yyyy/MM/dd').format(
  //                       DateTime.parse(snapshot.data.publishedAt),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               height: 200,
  //               width: double.infinity,
  //               child: Padding(
  //                 padding: EdgeInsets.all(20),
  //                 child: Row(
  //                   children: [
  //                     VerticalDivider(
  //                       color: Theme.of(context).primaryColor,
  //                       thickness: 2.0,
  //                     ),
  //                     Container(
  //                       height: 100,
  //                       width: double.infinity,
  //                       child: Text(
  //                         snapshot.data.title,
  //                         style: TextStyle(
  //                           fontSize: 35,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.all(20),
  //               child: Text(
  //                 snapshot.data.description,
  //                 style: TextStyle(
  //                   color: Colors.grey,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.all(20),
  //               child: Text(
  //                 snapshot.data.content,
  //                 style: TextStyle(
  //                   color: Colors.grey,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // });
}
