import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const id = 'AboutUs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Samyak',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                thickness: 3,
                color: Colors.white.withOpacity(0.7),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.call,
                    size: 50,
                    color: Colors.yellow,
                  ),
                  title: Center(
                    child: Text('+91 9974307357',
                    style: TextStyle(
                      fontSize: 30
                    ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.green.shade900.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
