import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/getJson.dart';
import 'package:loksewaguide/splash.dart';

class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  Widget customcard(String topicName, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
      shadowColor: Colors.deepPurple,
      elevation: 2,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Material(
                child: Container(
                  child: ExpansionTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      topicName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>SplashScreen()));
                              },
                              child: Text(
                                "Syllabus",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>SplashScreen()));
                              },
                              child: Text(
                                  "Notes",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>GetQuizJson(jsonPath)));
                              },
                              child: Text(
                                  "Test",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>SplashScreen()));
                              },
                              child: Text(
                                  "Videos",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Officer"),
      ),
      drawer: Drawer(),
      body: ListView(
        children: [

          customcard(
              "Computer Network",
              "assets/ai_agent.json"),
          customcard(
              "Artificial Intelligence",
              "assets/ai_agent.json"),
          customcard(
              "Data Structures & Algorithms",
              "assets/ai_set1.json"),
          customcard(
              "Object Oriented Programming",
              "assets/history_of_ai_1.json"),
        ],
      ),
    );
  }
}
