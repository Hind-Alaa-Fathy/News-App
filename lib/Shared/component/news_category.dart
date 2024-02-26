import 'package:flutter/material.dart';

class NewsCategory extends StatelessWidget {
   NewsCategory({super.key,required this.category,required this.image});
  String category;
  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
      child: Container(
          height: 100,
           width: 250,
           decoration: BoxDecoration(
               image:DecorationImage(image:AssetImage(image) ,fit: BoxFit.cover),
             borderRadius: BorderRadius.circular(30),
             boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 4)]
           ),
           child: Center(
             child: Container(
                 decoration: const BoxDecoration(
                     boxShadow: [BoxShadow(color: Colors.white70,blurRadius: 2)]
                 ),
                 child: Text(category,style:  const TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w500))),
           )),

    );
  }
}
