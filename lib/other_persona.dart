import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'main.dart';

class OtherPersona extends StatefulWidget {
  OtherPersona({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OtherPersonaState createState() => _OtherPersonaState();

}

class _OtherPersonaState extends State<OtherPersona> {


@override
Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(2.0,150.0, 2.0, 150.0),
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
        child: Image.asset(persona.image, width: 90.0, height: 90.0),
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