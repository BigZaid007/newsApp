import 'package:flutter/material.dart';
import 'package:news_app/services/newsApi.dart';
import 'package:news_app/view/newsApp.dart';

class content extends StatelessWidget {

  final String title;
  final String des;
  final String img;
  final String contents;
  final String author;
  final String url;

  content(this.title,this.des,this.img,this.contents,this.author,this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>newsApp()));
        }, icon:Icon(Icons.arrow_back,color: Colors.black,)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 7,
        title: Text('NewsHub',style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff364fc7),fontSize: 30,letterSpacing: 4),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xff364fc7),
            ),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('by $author',style: TextStyle(fontStyle: FontStyle.italic,color: Color(0xffB0B7C6)),),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(des,style: TextStyle(
              fontStyle: FontStyle.normal,fontSize: 19,color: Colors.white70
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Read Full Article',style: TextStyle(
              color: Colors.red
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){

              },
              child: Text(url,style: TextStyle(
                  color: Colors.red
              ),),
            ),
          )

        ],
      ),
    );
  }
}
