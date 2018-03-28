import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gestures"),
      ),
      body: new Center(
          child: new GestureDetector(
            child: new Icon(
              Icons.android,
              size: 200.0,
            ),
            onTap: () {
              print("onTap");
            },
            onDoubleTap: () {
              print("onDoubleTap");
            },
            onLongPress: () {
              print("onLongPress");
            },
            onVerticalDragStart: (details){
              print("在垂直方向开始位置:"+details.globalPosition.toString());
            }, onVerticalDragEnd: (details){
            print("在垂直方向结束位置:"+details.primaryVelocity.toString());
          },
          )),
    );
  }
}