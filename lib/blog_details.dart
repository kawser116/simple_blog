import 'package:flutter/material.dart';
import 'package:simple_blog/Models/data_model.dart';

class BlogDetails extends StatefulWidget {

  DataModel data;
  BlogDetails(this.data);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Details"),
          backgroundColor: Colors.blueGrey,
        ),
        body: new ListView(
            children: <Widget>[

            new SizedBox(height: 10.0,),

            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text(widget.data.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),

            new SizedBox(height: 10.0,),

            new Container(
              child: new Column(
                children: <Widget>[
                  new Image.network(
                    widget.data.cover_photo,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),

                  new SizedBox(height: 10.0,),

                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text(widget.data.description,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                              textAlign: TextAlign.start,
                            ))
                      ],
                    ),
                  ),

                  new SizedBox(height: 10.0,),

                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text("Categories : " + widget.data.categories.join(" , "),
                              style: TextStyle(
                                  fontSize: 16),
                              textAlign: TextAlign.start,
                            ))
                      ],
                    ),
                  ),

                  new SizedBox(height: 10.0,),

                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          new Image.network(
                          widget.data.author.avatar,
                            height: 75.0,
                            fit: BoxFit.cover,
                          ),

                        new SizedBox(
                          width: 6.0,
                        ),

                        new Container(

                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                new Text("Author : " + widget.data.author.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                              new Text("Profession : " + widget.data.author.profession,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),

                      ],

                    ),

                  ),

                ],
              ),
            ),

          ],

        ),
      );
  }
}
