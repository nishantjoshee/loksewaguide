import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/getJson.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget customcard(String topicName, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomePage()));
                                },
                                child: Text(
                                  "Notes",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.deepPurple,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              GetQuizJson(jsonPath)));
                                },
                                child: Text(
                                  "Quiz Test",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.deepPurple,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomePage()));
                                },
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                    fontSize: 12,
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
        elevation: 5,
        title: Text("PSC Computer Officer"),
      ),
      body: ListView(
        children: [
          customcard(
            "Computer Fundamental",
            "assets/computer_fundamental_1.json",
          ),
          customcard(
            "Computer Network",
            "assets/ai_agent.json",
          ),
          customcard(
            "Computer Organization & Architecture",
            "assets/ai_agent.json",
          ),
          customcard(
            "Digital Electronics / Logic Circuit",
            "assets/ai_agent.json",
          ),
          customcard(
            "Artificial Intelligence",
            "assets/ai_agent.json",
          ),
          customcard(
            "Data Structures & Algorithms",
            "assets/ai_set1.json",
          ),
          customcard(
            "Database Management System",
            "assets/ai_agent.json",
          ),
          customcard(
            "Object Oriented Programming",
            "assets/history_of_ai_1.json",
          ),
          customcard(
            "Operating System",
            "assets/ai_agent.json",
          ),
          customcard(
            "Computer Graphics",
            "assets/ai_agent.json",
          ),
          customcard(
            "Software Engineering Principles (System Analysis & Desgin)",
            "assets/ai_agent.json",
          ),
          customcard(
            "Theory of Computation",
            "assets/ai_agent.json",
          ),
          customcard(
            "Compiler Design",
            "assets/ai_agent.json",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text("Home"),
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.library_books, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Model Sets'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Feedback')),
        ],
      ),
    );
  }
}
