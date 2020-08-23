import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/ai_set1.json"),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            )
        );
        }else{
        return quizpage(mydata : mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {

  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key : key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.deepPurple;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;


  Map<String, Color> btncolor ={
    "a": Colors.deepPurple,
    "b": Colors.deepPurple,
    "c": Colors.deepPurple,
    "d": Colors.deepPurple,
  };

  void checkanswwer(String k){
    if(mydata[2]["1"] == mydata[1]["1"][k]){
      marks = marks + 1;
      colortoshow = right;
    }else{
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });
  }

  Widget choiceButton(String k){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(10),
        onPressed: () => checkanswwer(k),
        child: Text(
          mydata[1]["1"][k],
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,

          ),
        ),
        color: btncolor[k],
        minWidth: 500,
        height: 40,
        splashColor: Colors.amber,
        highlightColor: Colors.amber,
        elevation: 6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
            context: context,
            builder: (context) =>AlertDialog(
              title: Text(
                "Hey, Computer Officer !"
              ),
              content: Text(
                "You can't go back during quiz",
              ),
              actions: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Ok"
                  ),
                )
              ],
            )
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Material(
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                          child: Icon(
                            Icons.timer,
                            size: 50,
                          ),
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Score : $marks / 100",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                )
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  mydata[0]["1"],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    choiceButton("a"),
                    choiceButton("b"),
                    choiceButton("c"),
                    choiceButton("d"),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
