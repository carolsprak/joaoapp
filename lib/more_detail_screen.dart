import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main.dart';

class MoreDetailScreen extends StatefulWidget {
  @override
  _MoreDetailScreenState createState() => _MoreDetailScreenState();

  Widget buildDetail(BuildContext context, String image, String name, String description, descriptionEn) {
    return MoreDetailScreen().createState().buildDetail(context, image, name, description, descriptionEn);
  }

}

class _MoreDetailScreenState extends State<MoreDetailScreen> {

  String image;
  String name;
  String description;
  String descriptionEn;

  Widget buildDetail(BuildContext context, String image, String name, String description, String descriptionEn){
    this.image = image;
    this.name = name;
    this.description = description;
    this.descriptionEn = descriptionEn;
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
        padding:  EdgeInsets.fromLTRB(30.w,100.h, 30.w, 100.h),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w800),),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                      },
                      child: Image.asset(this.image, width: 320.w, height: 320.h),
                    ),

                  ]),
              Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Image.asset("assets/images/brazil.png", width: 60.w,),
                    ),
                    Text("$description", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400))


                  ]),
              Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Image.asset("assets/images/england.png", width: 60.w),
                    ),
                    Text("$descriptionEn", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400))


                  ]),

            ],
          ),
        ),
      ),

    );;
  }
}
