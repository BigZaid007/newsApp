import 'package:flutter/foundation.dart';

class artical
{
  final String title;
  final String description;
  final String artUrl;
  final String imageUrl;
  final String content;
  final String author;

  artical({required this.title,required this.description,required this.artUrl,required this.imageUrl,required this.content,required this.author});

  factory artical.fromJson(Map<String,dynamic> jsonDate)
  {
    return artical(
      title: jsonDate['title'],
      description: jsonDate['description'],
      imageUrl:jsonDate['urlToImage'],
      artUrl:jsonDate['url'],
      content:jsonDate['content'],
      author: jsonDate['author']
    );
  }

}