import 'package:flutter/material.dart';
import 'package:loksewaguide/homePage.dart';
import 'package:loksewaguide/markDown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MarkDown(),
    );
  }
}



