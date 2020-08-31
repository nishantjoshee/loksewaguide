import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loksewaguide/getJson.dart';

class SecondPage extends StatefulWidget {


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Widget gotoNotes(String topicName, String imagePath, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetQuizJson(jsonPath),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(),
                      imageUrl: imagePath,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                        topicName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget gotoSyllabus(String topicName, String imagePath, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetQuizJson(jsonPath),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(),
                      imageUrl: imagePath,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                        topicName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget gotoQuiz(String topicName, String imagePath, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetQuizJson(jsonPath),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(),
                      imageUrl: imagePath,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                        topicName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget terms(String topicName, String imagePath, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetQuizJson(jsonPath),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(),
                      imageUrl: imagePath,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                        topicName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget quizPreparation(String topicName, String imagePath, String jsonPath) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetQuizJson(jsonPath),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(),
                      imageUrl: imagePath,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                        topicName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: gotoNotes(
                        "Syllabus",
                        "https://specials-images.forbesimg.com/imageserve/5ed529bea40c3d0007ed24d0/960x0.jpg",
                        "assets/ai_agent.json"),
                  ),
                  Expanded(
                    child: gotoNotes(
                        "Notes",
                        "https://miro.medium.com/max/2560/1*sMryEXZVPKFjGNcfSzE8Mw.jpeg",
                        "assets/ai_set1.json"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: gotoNotes(
                          "Quiz Test",
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJJRH9OEt_6h1HZ2kioDZBVOYbZBYpxgVxcw&usqp=CAU",
                          "assets/history_of_ai_1.json")),
                  Expanded(
                      child: gotoNotes(
                          "Terms to know",
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJJRH9OEt_6h1HZ2kioDZBVOYbZBYpxgVxcw&usqp=CAU",
                          "assets/history_of_ai_1.json")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
