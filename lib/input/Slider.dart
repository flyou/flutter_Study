import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  double currentPosition = 66.0;


  onSliderChange(double position) {
    setState(() {
      print(position);
      currentPosition = position;

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Slider"),
      ),
      body: new Center(
        child: new Slider(
          label: "进度",
          min: 0.0,
          max: 100.0,
          value: currentPosition,
          onChanged: onSliderChange,
        ),
      ),
    );
  }
}
