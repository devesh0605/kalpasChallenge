import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List result = [];
  bool isLoading = false;

  Future<void> getNews() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://api.first.org/data/v1/news');
    var response = await http.get(url);
    //print(json.decode(response.body));
    setState(() {
      result = json.decode(response.body)['data'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 35,
                                      onPressed: () {},
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              result[index]['title'].toString(),
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
                                              result[index]['summary']
                                                  .toString(),
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
                                              result[index]['published']
                                                  .toString(),
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
                          itemCount: result.length,
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
                      Container(
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
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
