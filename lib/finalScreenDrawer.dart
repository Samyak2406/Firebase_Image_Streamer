import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imagesonline/Google_signIn.dart';

String text='';

class finalScreenDrawer extends StatefulWidget {
  @override
  _finalScreenDrawerState createState() => _finalScreenDrawerState();
}

class _finalScreenDrawerState extends State<finalScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: GestureDetector(
                onTap: ()async {
                  await signInWithGoogle();
                  setState(() {
                    text='Sign Out';
                  });
                },
                child: Container(
                  child: FractionallySizedBox(
                    heightFactor: 0.7,
                    widthFactor: 0.35,
                    child:CircleAvatar(
                      backgroundImage: AssetImage('images/google.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'About us:',//Just for show
              style: TextStyle(
                color: Colors.grey.shade200
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await signOutGoogle();
              setState(() {
                text='';
              });
            },
            child: ListTile(
              title: Text(
                  text,
                style: TextStyle(
                  color: Colors.grey.shade200
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
