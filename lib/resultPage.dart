import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loksewaguide/answerPage.dart';
import 'package:loksewaguide/homePage.dart';

class ResultPage extends StatefulWidget {
  int marks;
  int qnLength;
  var mydata;
  ResultPage({Key key, @required this.marks, this.qnLength, this.mydata})
      : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState(marks, qnLength, mydata);
}

class _ResultPageState extends State<ResultPage> {
  int marks;
  int qnLength;
  var mydata;
  _ResultPageState(this.marks, this.qnLength, this.mydata);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Result"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Image(
            height: 100,
            image: AssetImage("images/loksewa.png"),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 0, 10),
              child: Text(
                "CONGRATULATIONS",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Divider(
            color: Colors.black,
            height: 30,
            indent: 50,
            endIndent: 50,
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: Center(
              child: Text(
                "Total no. of questions: $qnLength",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
            child: Center(
              child: Text(
                "Right answers:  $marks",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          Divider(
            height: 30,
            indent: 50,
            endIndent: 50,
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnswerPage(
                        qnLength: qnLength,
                        mydata: mydata,
                      )),
                );
              },
              color: Colors.deepPurple,
              child: Text(
                "Check Answers",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text("Back"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.refresh,
              color: Colors.green,
              size: 30,
            ),
            title: new Text(
              'Play Again',
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(
                'Home',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              )),
        ],
      ),
    );
  }
}
