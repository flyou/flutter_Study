import 'package:flutter/material.dart';
import 'package:test1/FlyouIcons.dart';


void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Icons"),
      ),
      body: new Center(
        child: new Icon(FlyouIcons.transporting,size: 100.0,color: Colors.blueAccent)
      ),
    );
  }
}
