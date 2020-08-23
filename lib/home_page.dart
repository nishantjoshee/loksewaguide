import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget customcard(){
    return Padding(
      padding: EdgeInsets.all(10),
    );

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        customcard(),
      ],
    );
  }
}
