import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'more_detail_screen.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();

  Widget buildDetail(BuildContext context, Persona p, int i) {
    return DetailScreen().createState().buildDetail(context, p.image, p.name, p.description, p.descriptionEn, i);
  }

}

class _DetailScreenState extends State<DetailScreen> {

  String image;
  String name;
  String description;
  String descriptionEn;
  int index;

  Widget buildDetail(BuildContext context, String image, String name, String description, String descriptionEn, int i){

    this.image = image;
    this.name = name;
    this.description = description;
    this.descriptionEn = descriptionEn;
    this.index = i;
    return build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name)
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2.0,150.0, 2.0, 150.0),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    this.index == 0 || this.index == 5 ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => {
                          this.index == 0 ? _nextDetail(context, MyHomePage().characters[4],4) :
                          _nextDetail(context, MyHomePage().characters[8],8)
                        }) : IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => {
                          _nextDetail(context, MyHomePage().characters[this.index-1], this.index-1)
                        })  ,
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        _moreDetail(context);
                      },
                      child: Image.asset(this.image, width: 150.0, height: 150.0),
                    ),
                    this.index == 4 || this.index == 8 ? IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () => {
                          this.index == 4 ? _nextDetail(context, MyHomePage().characters[0], 0) :
                          _nextDetail(context, MyHomePage().characters[5], 5)
                        }) :  IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () => {
                          _nextDetail(context, MyHomePage().characters[this.index+1], this.index+1)
                        })
                  ]),

            ],
          ),
        ),
      ),

    );
  }

   _moreDetail(BuildContext context) {
     Navigator.push(
         context,
         MaterialPageRoute(builder: (context) =>
             MoreDetailScreen().buildDetail(context, this.image, this.name, this.description, this.descriptionEn),
             settings: RouteSettings(name: "/more_detail"))

     );
  }

  _nextDetail(BuildContext context, Persona persona, int i){
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            DetailScreen().buildDetail(context, persona, i),
            settings: RouteSettings(name: "/detail/$i"))

    );
  }
}
