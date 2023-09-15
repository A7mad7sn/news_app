import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Data/API/dio_news_getter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Reps/news_repository.dart';
import '../../Data/models/news.dart';

part 'news_topheadlines_state.dart';

class NewsTopHeadLinesCubit extends Cubit<NewsTopHeadLinesState> {
  List<News> news = [];
  NewsTopHeadLinesCubit() : super(NewsTopHeadLinesInitial());

  List<News> newsGetter() {
    NewsRepository(DioNewsGetter()).newsGetter().then((news) {
      emit(NewsTopHeadLinesLoaded(news));
      this.news = news;
    });
    return news;
  }

  void disactivate() {
    emit(NewsTopHeadLinesInitial());
  }
}
