import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/resultPage.dart';

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
  int i = 1;
  int timer = 30;
  String showtimer = "30";
  bool disableAnswer = false;

  Map<String, Color> btncolor ={
    "a": Colors.deepPurple,
    "b": Colors.deepPurple,
    "c": Colors.deepPurple,
    "d": Colors.deepPurple,
  };

   bool canceltimer = false;

  @override
  void initState(){
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){
          t.cancel();
          nextquestion();
        }else if(canceltimer == true){
          t.cancel();
        }else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });

  }

  void nextquestion(){
    canceltimer = false;
    timer = 30;
    

    setState(() {
      if(i<20){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(),
        ));
      }
      btncolor["a"] = Colors.deepPurple;
      btncolor["b"] = Colors.deepPurple;
      btncolor["c"] = Colors.deepPurple;
      btncolor["d"] = Colors.deepPurple;
      disableAnswer = false;

    });
    starttimer();
  }

  void checkanswwer(String k){
    if(mydata[2][i.toString()] == mydata[1][i.toString()][k]){
      marks = marks + 1;
      colortoshow = right;
    }else{
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });

    Timer(Duration(seconds: 1), nextquestion);
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
          mydata[1][i.toString()][k],
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
                            size: 40,
                          ),
                        ),
                        Text(
                          showtimer,
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Question $i of 20",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Score : $marks / 20",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
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
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                absorbing: disableAnswer,
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
            ),

          ],
        ),
      ),
    );
  }
}
