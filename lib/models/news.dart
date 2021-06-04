import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsData {
  final String title;
  final String summary;
  final String published;
  bool isFav;

  NewsData({
    @required this.title,
    @required this.summary,
    @required this.published,
    @required this.isFav,
  });
}

class NewsProvider extends ChangeNotifier {
  List<NewsData> _currentNews = [];
  List get currentNews {
    return [..._currentNews];
  }

  void toggleFav(int index) {
    _currentNews[index].isFav = !_currentNews[index].isFav;
    notifyListeners();
  }

  Future<void> getNews() async {
    var url = Uri.parse('https://api.first.org/data/v1/news');
    var response = await http.get(url);
    //print(json.decode(response.body));
    var result = json.decode(response.body)['data'] as List;
    result.forEach((element) {
      _currentNews.add(NewsData(
        title: element['title'],
        summary: element['summary'],
        published: element['published'],
        isFav: false,
      ));
    });
    notifyListeners();
  }
}
