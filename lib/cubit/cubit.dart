import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/states.dart';
import 'package:news_api/models/news_model.dart';

import '../Shared/Network/remote/news_service.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(InitialNewsState());
  late List<NewsModel> news;
   void getNews(String category)async
  {
    emit(LoadingNewsState());
    try
        {
         news = await NewsService().getNews(category: category );
          emit(SuccessNewsState(news));
        }
        catch (e)
    {
      emit(FailureNewsState());
    }
  }
}