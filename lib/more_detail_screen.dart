import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MoreDetailScreen extends StatefulWidget {
  @override
  _MoreDetailScreenState createState() => _MoreDetailScreenState();

  Widget buildDetail(BuildContext context, String image, String name, String description) {
    return MoreDetailScreen().createState().buildDetail(context, image, name, description);
  }

}

class _MoreDetailScreenState extends State<MoreDetailScreen> {

  String image;
  String name;
  String description;

  Widget buildDetail(BuildContext context, String image, String name, String description){
    this.image = image;
    this.name = name;
    this.description = description;
    return build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name)
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0,130.0, 30.0, 130.0),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                      },
                      child: Image.asset(this.image, width: 230.0, height: 230.0),
                    ),

                  ]),
              Text("$description", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400))

            ],
          ),
        ),
      ),

    );;
  }
}
