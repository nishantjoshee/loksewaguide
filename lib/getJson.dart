import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loksewaguide/quiz_page.dart';

class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/ai_agent.json"),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
          );
        }else{
          return quizpage(mydata : mydata);
        }
      },
    );
  }
}
