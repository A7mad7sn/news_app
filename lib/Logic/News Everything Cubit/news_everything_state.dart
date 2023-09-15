part of 'news_everything_cubit.dart';

abstract class NewsEverythingState {}

class NewsEverythingInitial extends NewsEverythingState {}

class NewsEverythingLoaded extends NewsEverythingState {
  final List<News> news;
  NewsEverythingLoaded(this.news);
}

class NewsEverythingSearching extends NewsEverythingState {
  final String query;
  NewsEverythingSearching(this.query);
}
