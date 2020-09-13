import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/resultPage.dart';

class QuizPage extends StatefulWidget {
  var mydata;
  int qnLength;
  QuizPage({Key key, @required this.mydata, this.qnLength}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata, qnLength);
}

class _QuizPageState extends State<QuizPage> {
  var mydata;
  int qnLength;
  _QuizPageState(this.mydata, this.qnLength);

  Color colortoshow = Colors.deepPurple;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showtimer = "30";
  bool disableAnswer = false;

  Map<String, Color> btncolor = {
    "a": Colors.deepPurple,
    "b": Colors.deepPurple,
    "c": Colors.deepPurple,
    "d": Colors.deepPurple,
  };

  bool canceltimer = false;

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    int length = qnLength;

    setState(() {
      if (i < length) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks : marks, qnLength : qnLength, mydata : mydata),
        ));
        canceltimer = true;
      }

      btncolor["a"] = Colors.deepPurple;
      btncolor["b"] = Colors.deepPurple;
      btncolor["c"] = Colors.deepPurple;
      btncolor["d"] = Colors.deepPurple;
      disableAnswer = false;
      qnLength = qnLength;
    });
    starttimer();
  }

  void checkanswwer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 1;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
      qnLength = qnLength;
    });

    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choiceButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 10,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        onPressed: () => checkanswwer(k),
        child: Text(
          mydata[1][i.toString()][k],
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        color: btncolor[k],
        minWidth: 500,
        height: 10,
        splashColor: Colors.amber,
        highlightColor: Colors.amber,
        elevation: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int length = qnLength;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Hey, Computer Officer !"),
                  content: Text(
                    "You can't go back during quiz",
                  ),
                  actions: [
                    FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Ok"),
                    )
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 225,
              width: double.infinity,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                          child: Row(
                            children: [
                              Material(
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text("$i of $length",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                  ),
                                  //color: Color.fromRGBO(69, 61, 85, 100),
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 40, 30, 0),
                          child: Row(
                            children: [
                              Material(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      Text(
                                        showtimer,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //color: Color.fromRGBO(69, 61, 85, 100),
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 40, 20, 0),
                          child: Row(
                            children: [
                              Material(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text("Score: $marks",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                ),
                                // color: Color.fromRGBO(69, 61, 85, 100),
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: Text(
                        mydata[0][i.toString()],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: AbsorbPointer(
                absorbing: disableAnswer,
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
