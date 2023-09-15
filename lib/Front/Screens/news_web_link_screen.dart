import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Data/models/news.dart';

class NewsWebScreen extends StatelessWidget {
  final News news;
  const NewsWebScreen({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
          backgroundColor: Colors.amber,
          leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: WebView(
          initialUrl: news.link,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
