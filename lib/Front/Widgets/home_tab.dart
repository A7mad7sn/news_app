import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Front/Widgets/theme_swapper_button.dart';
import 'package:flutter_app/Logic/News%20Top%20HeadLines%20Cubit/news_topheadlines_cubit.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/news.dart';
import 'news_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<News> allNews;
  @override
  void initState() {
    baseUrl =
        'https://newsapi.org/v2/top-headlines?apiKey=9904595b2aa749e99a5fd71eb7585926&country=$currentRegion';
    allNews = BlocProvider.of<NewsTopHeadLinesCubit>(context).newsGetter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: regionDrawer(context),
        appBar: AppBar(
          actions: const [
            ThemeSwapButton(),
          ],
          title: const Text("Top Headlines"),
          backgroundColor: Colors.amber,
        ),
        body: blocController());
  }

  Widget blocController() {
    return BlocBuilder<NewsTopHeadLinesCubit, NewsTopHeadLinesState>(
        builder: (context, state) {
      if (state is NewsTopHeadLinesLoaded) {
        allNews = (state).news;
        return buildLoadedNews();
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  Widget buildLoadedNews() {
    ScrollController controller = ScrollController();
    return Scrollbar(
        controller: controller,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: controller,
          child: Column(
            children: [buildNewsGrid()],
          ),
        ));
  }

  Widget buildNewsGrid() {
    return GridView.count(
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: List.generate(allNews.length, (index) {
        return NewsItem(news: allNews[index]);
      }),
    );
  }

  Widget regionDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            "Choose Region",
            style: TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current : ",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                CircleFlag(currentRegion, size: 20),
                Text(
                  "  ${currentRegion.toUpperCase()}",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: List.generate(allRegions.length * 2 - 1, (index) {
              if (index.isEven) {
                int regionIndex = index ~/ 2;
                return ListTile(
                  leading: CircleFlag(allRegions[regionIndex], size: 40),
                  title: Text(
                    allRegions[regionIndex].toUpperCase(),
                    style: const TextStyle( fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      currentRegion = allRegions[regionIndex];
                      baseUrl =
                          'https://newsapi.org/v2/top-headlines?apiKey=9904595b2aa749e99a5fd71eb7585926&country=$currentRegion';
                      BlocProvider.of<NewsTopHeadLinesCubit>(context)
                          .disactivate();
                      allNews = BlocProvider.of<NewsTopHeadLinesCubit>(context)
                          .newsGetter();
                    });
                    Navigator.pop(context);
                  },
                );
                //separator
              } else {
                return const Divider(
                  color: Colors.amber,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
