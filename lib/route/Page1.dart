import 'package:flutter/material.dart';
import 'package:test1/route/Page2.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      '/page2': (BuildContext context) => new Page2("I am from Page1"),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page1"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/page2");
          },
          child: new Text("点我跳转"),
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
