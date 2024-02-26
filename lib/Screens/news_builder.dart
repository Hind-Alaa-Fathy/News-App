import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Shared/component/news_card.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class NewsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsStates>(
      builder: (context, state) {
        if (state is LoadingNewsState) {
          return const SizedBox(
            height: 458,
            child: Center(child: CircularProgressIndicator(color: Colors.orange)),
          );
        }
        else if (state is SuccessNewsState) {

          return NewsCard(newsModel: state.news,);
        }
        else if (state is FailureNewsState) {
          return const SizedBox(
            height: 458,
            child: Text("Error when loading data"),
          );
        }
        return Container();
      },
    );;
  }
}

