import 'package:flutter_app/Data/API/dio_news_getter.dart';

import '../models/news.dart';

class NewsRepository {
  final DioNewsGetter getter;

  NewsRepository(this.getter);
  Future<List<News>> newsGetter() async {
    final news = await getter.newsGetter();
    return news.map((article) => News.fromJson(article)).toList();
  }
}
