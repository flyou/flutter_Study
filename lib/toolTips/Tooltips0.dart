import 'package:flutter/material.dart';
import 'package:test1/toolTips/MyTooltips.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltips"),
      ),
      body: Center(
        child: MyTooltip(
            message: "点击删除",
            preferBelow: false,
            backgroundColor: Colors.lightGreenAccent,
            borderRadius: 45.0,
            widthFactor: 1.0,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Icon(
              Icons.delete,
              size: 50.0,
            )),
      ),
    );
  }
}
