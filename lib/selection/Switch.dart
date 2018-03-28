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
  var _isChecked = true;

  onSwitchChange(bool isChecked) {
    setState(() {
      print(isChecked);
      _isChecked = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Switch"),
      ),
      body: new Center(
        child: new Switch(value: _isChecked, onChanged: onSwitchChange),
      ),
    );
  }
}
