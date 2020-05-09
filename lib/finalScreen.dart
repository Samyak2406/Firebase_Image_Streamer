import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'my_storage.dart';

class finalScreen extends StatefulWidget {
  static const id = 'finalScreen';
  @override
  _finalScreenState createState() => _finalScreenState();
}

class _finalScreenState extends State<finalScreen> {
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImAgES oNliNe'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Your Purpose : ',
                style: TextStyle(
                  color: Colors.greenAccent,
                ),
              ),
            ),
            ListTile(
              title: Text('samyak'),
            ),
            ListTile(
              title: Text('vora'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
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
        )),
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
    image = Image.network(onValue.toString());
  });
  return image;
}
