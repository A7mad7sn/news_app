import 'package:flutter/material.dart';
import 'package:flutter_app/Data/models/news.dart';
import 'package:flutter_app/Front/Widgets/theme_swapper_button.dart';
import 'package:flutter_app/Logic/News%20Everything%20Cubit/news_everything_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../Logic/News Top HeadLines Cubit/news_topheadlines_cubit.dart';
import '../Widgets/home_tab.dart';
import '../Widgets/today_tab.dart';

class MainNewsPlatform extends StatefulWidget {
  const MainNewsPlatform({Key? key}) : super(key: key);

  @override
  State<MainNewsPlatform> createState() => _MainNewsPlatformState();
}

class _MainNewsPlatformState extends State<MainNewsPlatform> {
  late List<News> allNews;
  late NewsTopHeadLinesCubit newsCubit;

  List<Widget> tabs = [
    const HomeTab(),
    const TodayTab(),
  ];
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return connectedInternetCase();
        } else {
          return notConnectedInternetCase();
        }
      },
      child: Container(),
    );
  }

  Widget connectedInternetCase() {
    return Scaffold(
      body: tabs[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        iconSize: 40,
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
        ],
      ),
    );
  }

  Widget notConnectedInternetCase() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("No Internet Connection"),
        actions: const [ThemeSwapButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/no-internet.png"),
            const Text(
              "seems you are offline...\nnow you have no choice except playing with the theme changer in the up right 🙂",
              textAlign: TextAlign.center,
            )
          ],
        )),
      ),
    );
  }
}
