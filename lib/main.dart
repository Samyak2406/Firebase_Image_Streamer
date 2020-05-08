import 'package:flutter/material.dart';
import 'package:imagesonline/finalScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'my_storage.dart';


final _store=Firestore.instance;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    makeMyList();
  }

  void makeMyList() async{
    await for(var pokemon in _store.collection('pokemon').snapshots()){
      for(var pokemonName in pokemon.documents){
        data.add(pokemonName.data['name'].toString());
        print(pokemonName.data['name'].toString());
//        print('find me');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: finalScreen(),

    );
  }
}
