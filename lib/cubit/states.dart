import 'package:news_api/models/news_model.dart';

abstract class NewsStates {}
class InitialNewsState extends NewsStates{}
class LoadingNewsState extends NewsStates{}
class SuccessNewsState extends NewsStates{
  final List<NewsModel> news;

  SuccessNewsState(this.news);
}
class FailureNewsState extends NewsStates{}