import 'package:flutter/material.dart';
import 'package:flutter_app/news_app_router.dart';
import 'package:provider/provider.dart';

import 'Logic/Theme Provider/theme_changer.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeChanger, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.genetrateRoutes,
          theme: themeChanger.darkTheme ? ThemeData.dark() : ThemeData.light(),
        );
      },
    );
  }
}