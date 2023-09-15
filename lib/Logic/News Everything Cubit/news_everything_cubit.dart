import 'package:bloc/bloc.dart';
import 'package:flutter_app/Data/Reps/news_repository.dart';
import 'package:flutter_app/Data/models/news.dart';

import '../../Data/API/dio_news_getter.dart';

part 'news_everything_state.dart';

class NewsEverythingCubit extends Cubit<NewsEverythingState> {
  NewsEverythingCubit() : super(NewsEverythingInitial());
  List<News> news = [];

  List<News> newsGetter() {
    NewsRepository(DioNewsGetter()).newsGetter().then((news) {
      emit(NewsEverythingLoaded(news));
      this.news = news;
    });
    return news;
  }
}
