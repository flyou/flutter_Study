import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Hello Flutter")),
        body: new Text(
          "夜晚走在喧闹的小街上，反而心能更加的平静，"
              "或许这就是物极必反的缘故吧，"
              "总喜欢在最吵闹的地方去寻找那一份属于自己的宁静，"
              "可以不思考所有的困扰，也可以闭着眼睛静听来自远方的人间天堂的呼唤，"
              "然后在忽明忽暗的灯光下丢弃心中的包袱，和一脸的苦闷，"
              "再走到起点时，又翻去了一页，也尘封了以往。", style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,letterSpacing: 8.0,decorationColor: Colors.red),
        ));
  }
}
