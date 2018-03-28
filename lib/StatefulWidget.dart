import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  int currentIndex = 0;

 void  _onFloatActionButtonPressed() {
    setState(() {
      currentIndex =new Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StatefulWidget"),
      ),
      body: new Center(
          child: new IndexedStack(
        index: currentIndex,
        children: <Widget>[
          new Icon(
            Icons.cloud_download,
            size: 100.0,
            color: Colors.blue,
          ),
          new Icon(
            Icons.error_outline,
            size: 100.0,
            color: Colors.red,
          ),
          new Icon(
            Icons.check_circle,
            size: 100.0,
            color: Colors.green,
          ),
          new Icon(
            Icons.help,
            size: 100.0,
            color: Colors.yellowAccent,
          )
        ],
      )),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatActionButtonPressed,
        child: new Icon(Icons.track_changes),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
