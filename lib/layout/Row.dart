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
      body: new Table(
        children: <TableRow>[
          new TableRow(children: <Widget>[new Text("姓名",textAlign: TextAlign.center,), new Text("职位",textAlign: TextAlign.center)]),
          new TableRow(
              children: <Widget>[new Text("flyou",textAlign: TextAlign.center), new Text("终端开发工程师",textAlign: TextAlign.center)]),
          new TableRow(
              children: <Widget>[new Text("张三",textAlign: TextAlign.center), new Text("Java开发工程师",textAlign: TextAlign.center)]),
          new TableRow(
              children: <Widget>[new Text("李四",textAlign: TextAlign.center), new Text("大数据开发工程师",textAlign: TextAlign.center)]),
          new TableRow(
              children: <Widget>[new Text("王五",textAlign: TextAlign.center), new Text("Python数据工程师",textAlign: TextAlign.center)])
        ],

      ),
    );
  }
}