import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kalpas_internship/models/news.dart';
import 'package:kalpas_internship/screens/favorite_screen.dart';
import 'package:provider/provider.dart';

class NewsTestScreen extends StatefulWidget {
  @override
  _NewsTestScreenState createState() => _NewsTestScreenState();
}

class _NewsTestScreenState extends State<NewsTestScreen> {
  bool isLoading = false;

  Future<void> newsLoader() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<NewsProvider>(context, listen: false).getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    newsLoader();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newsResults =
        Provider.of<NewsProvider>(context, listen: false).currentNews;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 10,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: newsResults[index].isFav
                                          ? Icon(Icons.favorite)
                                          : Icon(Icons.favorite_border),
                                      iconSize: 35,
                                      color: newsResults[index].isFav
                                          ? Colors.red
                                          : null,
                                      onPressed: () {
                                        setState(() {
                                          Provider.of<NewsProvider>(context,
                                                  listen: false)
                                              .toggleFav(index);
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              newsResults[index].title == null
                                                  ? 'No data'
                                                  : newsResults[index].title,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              newsResults[index].summary == null
                                                  ? 'No data'
                                                  : newsResults[index].summary,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              newsResults[index].published,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: newsResults.length,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.format_list_bulleted_sharp,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'News',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return FavoriteScreen();
                          }));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 50,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Favs',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
