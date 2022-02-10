import 'package:news_app/model/atrical_model.dart';

class Articales
{
  final List<dynamic> articles;
  
  Articales({required this.articles});
  
  
  factory Articales.fromjson(Map<String,dynamic> jsonData)
  {
    return Articales(articles: jsonData['articles']);
    
  }


  
}