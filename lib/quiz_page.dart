import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/resultPage.dart';


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
        vertical: 4,
        horizontal: 10,
      ),
      child: MaterialButton(
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
        elevation: 7,
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
                  color: Colors.deepPurple,
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 120, 5, 0),
                  child: Material(
                    shadowColor: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            showtimer,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 120, 5, 0),
                  child: Material(
                    shadowColor: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      color: Colors.indigo,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "$i of 20",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 120, 5, 0),
                  child: Material(
                    shadowColor: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Score: $marks",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Material(
                elevation: 10,
                shadowColor: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    mydata[0][i.toString()],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Material(
                elevation: 10,
                shadowColor: Colors.deepPurple,
                child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
