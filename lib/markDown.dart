import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Markdown"),
      ),
      body: FutureBuilder(
          future: rootBundle.loadString("assets/file_sizes.md"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data,
                selectable: true,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  h2: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  h3: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
