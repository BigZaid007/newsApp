import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articales_model.dart';


import 'package:news_app/model/atrical_model.dart';

class newsApi
{

  String apiKey='3a16998f3d9e4196b9e1355ec13a571a';




  Future<List<artical>?> fetchNews() async
  {

    try{


      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articales articales=Articales.fromjson(jsonData);
        List<artical> articalList=articales.articles.map((e) => artical.fromJson(e)).toList();
        return articalList;

      }

      else
        print(response.statusCode.toString());



    }catch(ex){
      print(ex);
    }




  }

  Future<List<artical>?> fetchNewsbyCategory(String cat) async
  {

    try{


      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articales articales=Articales.fromjson(jsonData);
        List<artical> articalList=articales.articles.map((e) => artical.fromJson(e)).toList();
        return articalList;

      }

      else
        print(response.statusCode.toString());



    }catch(ex){
      print(ex);
    }




  }
}