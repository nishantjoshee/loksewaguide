import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loksewaguide/quiz_page.dart';

class GetQuizJson extends StatelessWidget {

  GetQuizJson(this.jsonPath);

  final String jsonPath;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonPath),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        final int qnLength = mydata[0].length;

        if(mydata == null){
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
          );
        }else{
          return QuizPage(mydata : mydata, qnLength : qnLength);
        }
      },
    );
  }
}
