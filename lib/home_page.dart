import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/quiz_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget customcard(String topicName, String description, String imagePath){
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation: 8,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    child: Container(
                      child: Text(
                          topicName,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Container(
                      child: ClipRect(
                      child: Image(
                        image: AssetImage(
                              imagePath,
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                    ),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Officer"),
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          customcard("Artificial Intelligence", "Learn more about artificial intelligence.", "images/ai.jpg"),
          customcard("Data Structure and Algorithm", "Let's learn about  different data structures and algorithms", "images/dsa.png"),
          customcard("Object Oriented Programming", "Object oriented programming concepts", "images/oop.png"),
          customcard("Computer Network", "Let's learn about computer network", "images/cn.jpg"),
          customcard("Database Management System", "Learn about DBMS and challenge yourself", "images/dsa.png"),
          customcard("Computer Graphics", "Learn how graphics system works inside a computer", "images/dsa.png"),
        ],
      ),
    );
  }
}
