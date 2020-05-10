import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'my_storage.dart';
import 'add_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'loadingScreen.dart';


class finalScreen extends StatefulWidget {
  static const id = 'finalScreen';
  @override
  _finalScreenState createState() => _finalScreenState();
}

class _finalScreenState extends State<finalScreen> {

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, loadingScreen.id,(Route<dynamic> route) => false);
  }

  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: add_image(),
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
      body:SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child:  ListView.builder(
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