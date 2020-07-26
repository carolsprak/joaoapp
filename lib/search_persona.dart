import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'detail_search_screen.dart';
import 'main.dart';

class SearchPersona extends StatefulWidget {
  SearchPersona({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPersonaState createState() => _SearchPersonaState();

}

class _SearchPersonaState extends State<SearchPersona> {


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('João App'),

    ),
    body: Padding(
        padding: const EdgeInsets.fromLTRB(2.0,20.0, 2.0, 20.0),
        child: Container(
          alignment: Alignment.topCenter,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, MyHomePage().characters[0], 0),
                      _viewCharacter(context, MyHomePage().characters[1], 1),
                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, MyHomePage().characters[2], 2),
                      _viewCharacter(context, MyHomePage().characters[3], 3),
                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      _viewCharacter(context, MyHomePage().characters[4], 4),
                      _viewCharacter(context, MyHomePage().characters[5], 5),
                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, MyHomePage().characters[6], 6),
                      _viewCharacter(context, MyHomePage().characters[7], 7),
                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
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
        child: Image.asset(persona.image, width: 70.0, height: 70.0),
      ));
}

_viewDetail(BuildContext context, Persona persona, int i){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          DetailSearchScreen().buildDetail(context, persona, i),
        settings: RouteSettings(name: "/detail/$i"),)
  );
}
}