import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Front/Widgets/theme_swapper_button.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/news.dart';
import '../../Logic/News Everything Cubit/news_everything_cubit.dart';
import 'image_container.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({super.key});

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  late List<News> todaysNews = [];
  late List<News> searchedTodaysNews;

  @override
  void initState() {
    baseUrl = todaysNewsUrl;
    BlocProvider.of<NewsEverythingCubit>(context).newsGetter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.search, color: Colors.blueAccent),
          leadingWidth: 20,
          title: TextFormField(
            
              cursorColor: Colors.white,
              textAlign: TextAlign.start,
              autofocus: false,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(hintText: "Search",hintStyle: TextStyle(color: Colors.white),
                  filled: true, fillColor: Colors.blueAccent),
              onChanged: (txt) {
                BlocProvider.of<NewsEverythingCubit>(context)
                    .emit(NewsEverythingSearching(txt));
              },
              ),
          actions: const [ThemeSwapButton()],
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<NewsEverythingCubit, NewsEverythingState>(
            builder: (context, state) {
          if (state is NewsEverythingLoaded) {
            todaysNews = (state).news;
            searchedTodaysNews = todaysNews;
            return buildAllNews();
          } else if (state is NewsEverythingSearching) {
            try {
              searchedTodaysNews = todaysNews
                  .where((element) => (element.title
                      .toLowerCase()
                      .contains(state.query.toLowerCase())))
                  .toList();
              return buildAllNews();
            } catch (e) {
              return const Scaffold();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }));
  }

  Widget buildAllNews() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: List.generate(searchedTodaysNews.length * 2 - 1, (index) {
          if (index.isEven) {
            int tmpIndex = index ~/ 2;
            return ListTile(
              leading: ImageContainer(
                urlToImage: searchedTodaysNews[tmpIndex].urlToImage,
                isSmall: true,
              ),
              title: Text(
                "${searchedTodaysNews[tmpIndex].title}\n",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                searchedTodaysNews[tmpIndex].source,
                style: const TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushNamed(context, detailsScreen,
                    arguments: searchedTodaysNews[tmpIndex]);
              },
            );
            //separator
          } else {
            return const Divider(
              color: Colors.blue,
            );
          }
        }),
      ),
    );
  }
}
