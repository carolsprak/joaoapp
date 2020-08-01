import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherPersona extends StatefulWidget {
  OtherPersona({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OtherPersonaState createState() => _OtherPersonaState();

}

class _OtherPersonaState extends State<OtherPersona> {


@override
Widget build(BuildContext context) {
  ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

  return Scaffold(
    appBar: AppBar(
      title: Text('João App'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            MyHomePage().search(context);
          },
        )
      ],
    ),
    body: Padding(
        padding:  EdgeInsets.fromLTRB(70.w,350.h, 70.w, 350.h),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, MyHomePage().characters[5], 5),
                      _viewCharacter(context, MyHomePage().characters[6], 6),

                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, MyHomePage().characters[7], 7),
                      _viewCharacter(context, MyHomePage().characters[8], 8),
                    ])
              ]),)),
     // This trailing comma makes auto-formatting nicer for build methods.
  );
}

Widget _viewCharacter(BuildContext context, Persona persona, int i) {
  return Card(
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {_viewDetail(context, persona, i);},
        child: Image.asset(persona.image, width: 200.w, height: 200.h),
      ));
}

_viewDetail(BuildContext context, Persona persona, int i){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          DetailScreen().buildDetail(context, persona, i),
        settings: RouteSettings(name: "/detail/$i"),)
  );
}
}