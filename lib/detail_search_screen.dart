import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'more_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailSearchScreen extends StatefulWidget {
  @override
  _DetailSearchScreenState createState() => _DetailSearchScreenState();

  Widget buildDetail(BuildContext context, Persona p, int i) {
    return DetailSearchScreen().createState().buildDetail(context, p.image, p.name, p.description, p.descriptionEn, i);
  }

}

class _DetailSearchScreenState extends State<DetailSearchScreen> {

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
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name)
      ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(20.w,350.h, 20.w, 350.h),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    this.index == 0  ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => {
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
                      child: Image.asset(this.image, width: 350.w, height: 350.h),
                    ),
                    this.index == 8 ? IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () => {
                           _nextDetail(context, MyHomePage().characters[0], 0)
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
            DetailSearchScreen().buildDetail(context, persona, i),
            settings: RouteSettings(name: "/detail/$i"))

    );
  }
}
