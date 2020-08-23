import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget customcard(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        child: Material(
          elevation: 10,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text("Universe"),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(
                    vertical: 10,
                  ) ,
                  child: Material(
                    child: Container(
                      child: Text("Sets: 10"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loksewa Guide"),
      ),
      body: ListView(
        children: [
          customcard(),
        ],
      ),
    );
  }
}
