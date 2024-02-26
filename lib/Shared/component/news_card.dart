import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';

import '../../Screens/web_view_screen.dart';

class NewsCard extends StatelessWidget {
  final List<NewsModel> newsModel;

  NewsCard({required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: newsModel[index].url,category: newsModel[index].title),));
          },
          child: Card(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.white60)),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20)),
                  child: Image(
                    image:  NetworkImage(newsModel[index].urlToImage?? ""),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Padding(
                      padding: EdgeInsets.only(top: 20,bottom: 10),
                      child: Center(child: Icon(Icons.error,color: Colors.blueGrey,size: 40,)),
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return  const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child:  CircularProgressIndicator(color: Colors.blueGrey),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 20),
                child: Center(child: Text(newsModel[index].title??"[Removed]",style: const TextStyle(fontSize: 30,color: Colors.black,),maxLines: 2,overflow: TextOverflow.ellipsis,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Center(child: Text(newsModel[index].description??"[Removed]",style: TextStyle(fontSize: 20,color: Colors.grey[700],overflow:TextOverflow.ellipsis),maxLines: 3,)),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 30),
                child: Center(child: Text(newsModel[index].publishedAt??"[Removed]",style:  TextStyle(fontSize: 25,color: Colors.blueGrey[700],overflow:TextOverflow.ellipsis),)),
              ),
            ],
          ),
                ),
        ),
        itemCount: newsModel.length,
      ),
    );
  }
}
