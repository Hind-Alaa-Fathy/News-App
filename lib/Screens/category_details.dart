import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/Screens/news_builder.dart';
import 'package:news_api/cubit/cubit.dart';
import 'package:news_api/cubit/states.dart';

class CategoryDetails extends StatelessWidget {
  String category;

  CategoryDetails({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Text(category,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 30)),
      ),
      body: BlocProvider(
        create: (context) => NewsCubit()..getNews(category),
        child: Column(
          children: [
            NewsBuilder(),
          ],
        ),
      ),
    );
  }
}
