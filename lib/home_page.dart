import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_blog/blog_details.dart';
import 'package:http/http.dart' as http;
import 'package:simple_blog/Models/data_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<DataModel>>getAllData() async{

    var api = "https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech";
    var data=await http.get(api);
    var parse = json.decode(data.body);
    var jsonData= parse['blogs'] as List;

    List<DataModel> dataModel = jsonData.map((json) => DataModel.fromJson(json)).toList();

    return dataModel;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Simple Blog"),
          backgroundColor: Colors.blueGrey,


        ),
      body: new ListView(
          children: <Widget>[

        new Container(
          margin: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height-20,
          child: new FutureBuilder(
            future: getAllData(),
            builder:(BuildContext c, AsyncSnapshot snapshot){

            if(snapshot.data == null){
                  return Center(
                    child: new Text("Loading Data....")
                  );
                  }
            else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext c, int index) {
                    return Card(
                      elevation: 10.0,
                      child: InkWell(
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Image.network(snapshot.data[index].cover_photo,
                              height: 150.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                            ),

                            new SizedBox(
                              width: 6.0,
                            ),

                            Flexible(
                              child:
                              Text(snapshot.data[index].title,style: TextStyle(fontSize: 20),),
                            )

                          ],
                        ),
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext c)=>BlogDetails(snapshot.data[index])));
                          }
                      ),
                    );
                 }
              );
              }
            },
          ),
        ),
      ]
      )
    );

  }
}
