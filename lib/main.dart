import 'package:flutter/material.dart';
import 'package:news_app/services/newsApi.dart';
import 'package:news_app/view/newsApp.dart';
import 'package:provider/provider.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: newsApp(),
    );
  }
}

