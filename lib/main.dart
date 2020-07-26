import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/detail_screen.dart';
import 'package:joaoapp/search_persona.dart';

import 'other_persona.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'João App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'João App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  final Map<int, Persona> characters = _MyHomePageState()._characters;

  void search(BuildContext context){
    return MyHomePage().createState()._search(context);
  }
}

class _MyHomePageState extends State<MyHomePage> {

  final Map<int, Persona> _characters = {
    0: Persona('João', "João é um hipopótamo, que consegue se transformar em muitas coisas.", "images/joaoapp.png"),
    1: Persona('Lunto', "Lunto é um cachorro muito esperto, que pulou de um foguete só para aprender a voar.", "images/lapp.png"),
    2: Persona('Pinguim', "Pinguim aprende que ser bom é bom, depois de conhecer João e Lunto.", "images/papp.png",),
    3: Persona('Menino', "Menino é muito curioso e adora participar de aventuras.", "images/mapp.png"),
    4: Persona('Lobinho', "Lobinho é o pai de Lunto e adora explorar novos lugares.", "images/loapp.png"),
    5: Persona('Dinossaurinho', "Dinossaurinho é o rei do mundo inteiro.", "images/dapp.png"),
    6: Persona('Morango', "Morango ganhou vida quando entrou no mundo misterioso.", "images/moapp.png"),
    7: Persona('Parafuso', "Parafuso é malvado e não se importa com o que os outros dizem.", "images/paapp.png"),
    8: Persona('Porco', "Porco mora no ninho do passarinho que ele comeu.", "images/piapp.png"),  
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('João App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _search(context);
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
                      _viewCharacter(context, this._characters[0], 0),
                      _viewCharacter(context, this._characters[1], 1),
                  ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, this._characters[2], 2),
                      _viewCharacter(context, this._characters[3], 3),
                    ]),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _viewCharacter(context, this._characters[4], 4),
                    ])
            ]),)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _otherCharacter();
          },
        tooltip: 'Mais',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

  Widget _otherCharacter() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            OtherPersona(),
            settings: RouteSettings(name: "/otherPersona"))

    );
  }

  void _search(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            SearchPersona(),
            settings: RouteSettings(name: "/searchPersona"))

    );
  }
}

class Persona {

  String name;
  String description;
  String image;

  Persona(this.name, this.description, this.image);

  String get personaName => this.name;
  String get personaDescricao => this.description;
  String get personaImage => this.image;
}
