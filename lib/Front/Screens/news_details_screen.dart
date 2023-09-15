import 'package:flutter/material.dart';

import 'package:flutter_app/Data/models/news.dart';
import 'package:flutter_app/Front/Widgets/image_container.dart';
import 'package:flutter_app/constants/strings.dart';

import '../Widgets/theme_swapper_button.dart';

class DetailsScreen extends StatelessWidget {
  final News news;
  const DetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          backgroundColor: Colors.amber,
          actions: const [ThemeSwapButton()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Title::
                  Text(news.title,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),

                  separator(),

                  //Image::
                  ImageContainer(urlToImage: news.urlToImage,isSmall: false,),

                  separator(),

                  //Description
                  tableGrid("Description", news.description, context),

                  separator(),

                  //Author
                  tableGrid("Author", news.author, context),

                  separator(),

                  //Source
                  tableGrid("Source", news.source, context),

                  separator(),

                  //PublishedAt
                  tableGrid("Published at", news.publishedAt, context),

                  separator(),

                  //News Link::
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, newsLinkScreen,
                          arguments: news);
                    },
                    icon: const Icon(Icons.link),
                    color: Colors.amber,
                    iconSize: 50,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget tableGrid(String property, String details, BuildContext context) {
    return Table(
      columnWidths: const {0: FixedColumnWidth(150), 1: FlexColumnWidth()},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      textDirection: TextDirection.ltr,
      border: TableBorder.all(
        style: BorderStyle.none,
      ),
      children: [
        TableRow(children: [
          Column(
            children: [
              Text(
                property,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
          Column(
            children: [
              Text(
                details,
                style: const TextStyle(fontSize: 16),
              )
            ],
          )
        ])
      ],
    );
  }

  Widget separator() {
    return const Divider(
      thickness: 3,
      color: Colors.blue,
      indent: 16,
      endIndent: 16,
    );
  }
}
