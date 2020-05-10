import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'my_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class finalScreen extends StatefulWidget {
  static const id = 'finalScreen';
  @override
  _finalScreenState createState() => _finalScreenState();
}

class _finalScreenState extends State<finalScreen> {
  String image;
String getRandomId(){
  Random random=Random();
  String temp='';
  for(int i=0;i<10;i++){
    temp=(random.nextInt(9)+1).toString()+temp;
  }
  print('temp is $temp');
  return temp;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          try{
            var image = await ImagePicker.pickImage(  source: ImageSource.gallery);
            FirebaseStorage _pokemon=FirebaseStorage.instance;
            var tempId=getRandomId();
            StorageReference reference=_pokemon.ref().child('pokemon/'+tempId);
            StorageUploadTask uploadTask = reference.putFile(image);
            Firestore _store=Firestore.instance;
            _store.collection('pokemon').add(
              {
                'name':tempId
              }
            );
          }catch(e){}
        },
        child: FittedBox(
          child: Icon(
            Icons.image,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('ImAgES oNliNe'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    '_',
                    style: TextStyle(
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('#'),
            ),
            ListTile(
              title: Text('@'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
        return FutureBuilder(
          future: _getImage(index),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Container(
                height: 250,
                child: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        );
          },
        ),
      ),
    );
  }
}

Future<dynamic> _getImage(int index) async {
  Image image;
  String temp;
  temp = 'pokemon/' + data[index];
//  print('catch me $temp');
  await FirebaseStorage.instance
      .ref()
      .child(temp)
      .getDownloadURL()
      .then((onValue) {
    image = Image.network(
        onValue.toString(),
    );
  });
  return image;
}
