import 'package:flutter/material.dart';
import 'package:flutter_app/Data/models/news.dart';
import 'package:flutter_app/Front/Widgets/image_container.dart';
import 'package:flutter_app/constants/strings.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsetsDirectional.all(8),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, detailsScreen, arguments: news);
          },
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              alignment: Alignment.bottomCenter,
              child: Text(
                news.title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: ImageContainer(urlToImage: news.urlToImage,isSmall: false,)),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.bottomCenter,
              child: Text(
                news.source,
                style: const TextStyle(fontSize: 16, color: Colors.red),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          ])),
    );
  }
}
