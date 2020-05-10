import 'package:flutter/material.dart';
import 'package:imagesonline/finalScreen.dart';
import 'loadingScreen.dart';
import 'AboutUs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: loadingScreen.id,
      routes: {
        loadingScreen.id: (context) => loadingScreen(),
        finalScreen.id: (context) => finalScreen(),
        AboutUs.id:(context) => AboutUs()
      },
    );
  }
}