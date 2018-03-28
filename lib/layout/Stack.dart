import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stack"),
      ),
      body: new Stack(

        children: <Widget>[
          new Icon(
            Icons.check_circle,
            size: 100.0,
            color: Colors.yellow,
          ),
          new Icon(Icons.check_circle,   color: Colors.lightGreen,)

        ],
        alignment: Alignment.bottomRight,
      ),
    );
  }
}
