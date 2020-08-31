import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loksewaguide/quizList.dart';
import 'package:loksewaguide/secondPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => QuizList(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50,
              ),
            ),
            Container(
              child: Image(
                image: AssetImage(
                  "images/loksewa.png"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
