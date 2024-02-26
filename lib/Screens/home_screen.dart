import 'package:flutter/material.dart';
import 'package:news_api/Screens/news_builder.dart';

import 'package:news_api/Shared/component/news_card.dart';
import 'package:news_api/Shared/component/news_category.dart';

import 'package:news_api/models/news_model.dart';

import 'category_details.dart';




class HomeScreen extends StatelessWidget {
  List<String> category = ["business","entertainment","health","science","sports","technology"];
  List<String> images = ["assets/images/business.png","assets/images/entertainment.png",
    "assets/images/health.png","assets/images/science.jpg","assets/images/sports.png",
    "assets/images/technology.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("News",style:TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold)),
             Text("App",style:TextStyle(color: Colors.blueGrey,fontSize: 30,fontWeight: FontWeight.bold)),
           ],
        ),
      ),
      backgroundColor: Colors.white60,
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>  GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(category: category[index],),));
                },child: NewsCategory(category: category[index],image: images[index])),
                separatorBuilder: (context, index) =>
                const SizedBox(width: 5,),
                itemCount: category.length),
          ),
         NewsBuilder(),

        ],
      ),
    );
  }
}
