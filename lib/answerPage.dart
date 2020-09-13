import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  int qnLength;
  var mydata;
  AnswerPage({this.qnLength, this.mydata});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$qnLength"
        ),
      ),
    );
  }
}
