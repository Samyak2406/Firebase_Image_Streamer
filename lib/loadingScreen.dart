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
    final _store = Firestore.instance;
    await for (var pokemon in _store.collection('pokemon').snapshots()) {
      for (var pokemonName in pokemon.documents) {
        data.add(pokemonName.data['name'].toString());
//        print(pokemonName.data['name'].toString());
      }
      data.sort();
      break;
    }
    Navigator.pushNamed(context, finalScreen.id);
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
