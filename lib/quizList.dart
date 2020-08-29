import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loksewaguide/quiz_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget customcard(String topicName, String imagePath){
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(),
          ));
        },
        child: Material(
          shadowColor: Colors.deepPurple,
          elevation:7,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:  5,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => LinearProgressIndicator(),
                          imageUrl: imagePath,
                        )
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
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: customcard("Artificial Intelligence", "https://specials-images.forbesimg.com/imageserve/5ed529bea40c3d0007ed24d0/960x0.jpg"),
                  ),
                  Expanded(
                    child: customcard("Data Structures & Algorithms", "https://miro.medium.com/max/2560/1*sMryEXZVPKFjGNcfSzE8Mw.jpeg"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customcard("Object Oriented Programming", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJJRH9OEt_6h1HZ2kioDZBVOYbZBYpxgVxcw&usqp=CAU"),
                  ),
                  Expanded(
                    child: customcard("Computer Network",  "https://www.kullabs.com/uploads/computer-network.jpg"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
