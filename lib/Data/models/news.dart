import 'package:flutter_app/Data/models/news.dart';

class News {
  late String source;
  late String author;
  late String title;
  late String description;
  late String urlToImage;
  late String publishedAt;
  late String link;

  News(this.author, this.link, this.description, this.publishedAt,
      this.source, this.title, this.urlToImage);

  News.fromJson(Map<String, dynamic> news) {
    source = news['source']['name'] ?? "Not Available";
    author = news['author'] ?? "Not Available";
    title = news['title'] ?? "Not Available";
    description = news['description'] ?? "Not Available";
    urlToImage = news['urlToImage'] ?? "";
    publishedAt = news['publishedAt'] ?? "Not Available";
    link = news['url'] ?? "";
  }
}
