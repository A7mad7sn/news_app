import 'package:flutter/material.dart';
import 'package:flutter_app/Data/Reps/news_repository.dart';
import 'package:flutter_app/Front/Screens/loading_screen.dart';
import 'package:flutter_app/Front/Screens/news_details_screen.dart';
import 'package:flutter_app/Front/Screens/news_web_link_screen.dart';
import 'package:flutter_app/Logic/News%20Everything%20Cubit/news_everything_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/models/news.dart';
import 'Front/Screens/news_platform_screen.dart';
import 'Logic/News Top HeadLines Cubit/news_topheadlines_cubit.dart';
import 'constants/strings.dart';

class AppRouter {
  late NewsRepository newsRepository;
  late NewsTopHeadLinesCubit newsCubit;

  AppRouter() {
    newsCubit = NewsTopHeadLinesCubit();
  }

  Route? genetrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loadingScreen:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case mainScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => newsCubit,
                child: BlocProvider(
      create: (BuildContext context) => NewsEverythingCubit(),
      child: const MainNewsPlatform()
      )
      )
      );

      case detailsScreen:
        final news = settings.arguments as News;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => newsCubit,
                child: DetailsScreen(news: news)));

      case newsLinkScreen:
        final news = settings.arguments as News;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => newsCubit,
                child: NewsWebScreen(news: news)));
    }
  }
}
