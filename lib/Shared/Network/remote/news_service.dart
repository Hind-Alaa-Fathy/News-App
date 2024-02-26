


import 'package:dio/dio.dart';
import 'package:news_api/models/news_model.dart';

class NewsService
{
  final Dio dio = Dio();
  //late String category;
  Future<List<NewsModel>> getNews({required String category})async
  {
    //this.category = category;
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=a8cfc36d0ef64ef996f83a5d8cca5645&category=$category');
    Map<String,dynamic> fromJson = response.data;
    List<dynamic> results = fromJson['articles'];
    List<NewsModel> resultList = [];
    for(var result in results)
    {
      NewsModel newsModel = NewsModel.fromJson(result);
      resultList.add(newsModel);
    }
    return resultList;

  }
}