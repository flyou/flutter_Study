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
        title: new Text("Container"),
      ),
      body: new Center(
          child: new Container(
        alignment: Alignment.bottomRight,
        color: Colors.blue,
        width: 300.0,
        height: 300.0,
        child: new Container(
          padding:const EdgeInsets.only(top: 10.0,left: 10.0),
          alignment: Alignment.topLeft,
          color: Colors.lightBlueAccent,
          width: 100.0,
          height: 100.0,
          child: new Icon(Icons.android,color: Colors.red,),
        ),
      )),
    );
  }
}
