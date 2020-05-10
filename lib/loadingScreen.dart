import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imagesonline/finalScreen.dart';
import 'my_storage.dart';

class loadingScreen extends StatefulWidget {
  static const id = 'loadingScreen';
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    makeMyList();
  }

  void makeMyList() async {
    data=[];//For Refresh
    final _store = Firestore.instance;
    await for (var pokemon in _store.collection('pokemon').snapshots()) {
      for (var pokemonName in pokemon.documents) {
        data.add(pokemonName.data['name'].toString());
        print(pokemonName.data['name'].toString());
      }
      data.sort();
      data.insert(0, 'pokemon.jpg');
      break;
    }
    Navigator.pushNamedAndRemoveUntil(context, finalScreen.id,(Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
