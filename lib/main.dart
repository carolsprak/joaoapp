import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/detail_screen.dart';
import 'package:joaoapp/search_persona.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'other_persona.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    0: Persona('João', "João é um hipopótamo, que consegue se transformar em muitas coisas.", "assets/images/joaoapp.png", "João is a hippo who can transform into many things."),
    1: Persona('Lunto', "Lunto é um cachorro muito esperto, que pulou de um foguete só para aprender a voar.", "assets/images/lapp.png", "Lunto is a smart dog who jumped from a rocket, only so that he could learn to fly."),
    2: Persona('Pinguim', "Pinguim aprende que ser bom é bom, depois de conhecer João e Lunto.", "assets/images/papp.png", "Penguin learns it's good to be good after meeting João and Lunto."),
    3: Persona('Menino', "Menino é muito curioso e adora participar de aventuras.", "assets/images/mapp.png", "Boy is curious and loves to go in adventures."),
    4: Persona('Lobinho', "Lobinho é o pai de Lunto e adora explorar novos lugares.", "assets/images/loapp.png", "Lobinho is Lunto's father and loves to explore new places."),
    5: Persona('Dinossaurinho', "Dinossaurinho é o rei do mundo inteiro.", "assets/images/dapp.png", "Dinossaurinho is king of the whole world."),
    6: Persona('Morango', "Morango ganhou vida quando entrou no mundo misterioso.", "assets/images/moapp.png", "Strawberry came to life after coming to the mysterious world"),
    7: Persona('Parafuso', "Parafuso é malvado e não se importa com o que os outros dizem.", "assets/images/paapp.png", "Screw is evil and doesn't care what other people say."),
    8: Persona('Porco', "Porco mora no ninho do passarinho que ele comeu.", "assets/images/piapp.png", "Pig lives in the bird's nest he ate."),
  };

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
              _search(context);
            },
          )

        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(70.w ,50.h, 70.w, 50.h),
        child: Container(
           alignment: Alignment.topCenter,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Personagens do Livro\n\"O mundo desconhecido\"", textAlign: TextAlign.center, style: TextStyle(fontSize: 40.sp),),
                ),
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
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _downloadBook()
                ],)
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

  _launchURL() async {
    const url = 'https://bit.ly/3gmroo4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _downloadBook() {
    return  Card(
        child: RaisedButton(
          color: Colors.white,
          onPressed:
            _launchURL,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.w,20.h,12.w,0.h),
                child: Text("Baixe o Livro", textAlign: TextAlign.center,),
              ),
              Image.asset("assets/images/capa_app.png", width: 200.w, height: 140.h),
            ],
          ),
        ));
  }


}

class Persona {

  String name;
  String description;
  String descriptionEn;
  String image;

  Persona(this.name, this.description, this.image, this.descriptionEn);

  String get personaName => this.name;
  String get personaDescricao => this.description;
  String get personaDescricaoEn => this.descriptionEn;
  String get personaImage => this.image;
}
