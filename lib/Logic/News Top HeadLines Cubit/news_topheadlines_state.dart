part of 'news_topheadlines_cubit.dart';

@immutable
abstract class NewsTopHeadLinesState {}

class NewsTopHeadLinesInitial extends NewsTopHeadLinesState {}

class NewsTopHeadLinesLoaded extends NewsTopHeadLinesState {
  final List<News> news;
  NewsTopHeadLinesLoaded(this.news);
}
