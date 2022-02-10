
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/atrical_model.dart';
import 'package:news_app/model/atrical_model.dart';
import 'package:news_app/services/newsApi.dart';
import 'package:news_app/view/content.dart';
import 'package:provider/provider.dart';

class newsApp extends StatefulWidget {
  @override
  _newsAppState createState() => _newsAppState();
}

class _newsAppState extends State<newsApp> {

   newsApi api=newsApi();

   bool isSport=false;

  @override
  Widget build(BuildContext context) {
     var type;
    var news=api.fetchNewsbyCategory(type);
    var theNews=true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 7,
        title: Text('NewsHub',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blue,fontSize: 30,letterSpacing: 4),),
      ),
      body: FutureBuilder(


        future: theNews?api.fetchNews():news,

        builder: (BuildContext context,AsyncSnapshot snapshot)
        {

          List<artical> articles=snapshot.data;


          if(snapshot.hasData)
            return Column(
              children: [
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                          onTap:(){
                            setState(()  {
                              theNews=false;
                             type='sports';
                             news= api.fetchNewsbyCategory(type);
                             print(theNews);
                              //isSport=false;
                            });
                          },
                          child: customContainer('Sport', Colors.red)),
                      customContainer('Entertaiment', Colors.blue),
                      InkWell(
                          onTap: (){
                            setState(() {
                              type='technology';
                            });
                          },
                          child: customContainer('Technology', Colors.amber)),
                      customContainer('Business', Colors.black)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        customContainer('Science', Colors.deepPurple),
                        customContainer('Health', Colors.green),
                        customContainer('General', Colors.teal),

                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>content(articles[index].title, articles[index].description, articles[index].imageUrl, articles[index].artUrl,articles[index].author,articles[index].artUrl)));
            },
            child: Card(
              elevation: 8,
              child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(articles[index].imageUrl),
                              fit: BoxFit.contain
                          ),
                          //borderRadius: BorderRadius.circular(20),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(articles[index].title,style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700
                        ),),
                      ),
                      SizedBox(height: 10,),
                      Text(articles[index].description,style: TextStyle(
                          fontSize: 15
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(articles[index].author,style: TextStyle(
                            fontStyle: FontStyle.italic,color: Colors.blue
                        ),),
                      )
                    ],
                  ),
              ),
            ),
          ),  itemCount: articles.length,),
                )
              ],
            );
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }


  Widget customContainer(String name,Color color)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 3),
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 95,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color

        ),
        child: Text(name,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }

}
