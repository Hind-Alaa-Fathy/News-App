class NewsModel
{
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;


  NewsModel({required this.title, required this.description, required this.url,required this.urlToImage, required this.publishedAt});

  factory NewsModel.fromJson(Map<String,dynamic> json)
  {
    return NewsModel(title: json['title']??"", description: json['description']??"",
     urlToImage: json['urlToImage']?? "",publishedAt: json['publishedAt']?? "",url: json['url']??"");
  }

}