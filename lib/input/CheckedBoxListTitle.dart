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

  onCheckChange(bool isChecked) {
    setState(() {
      print(isChecked);
      _isChecked = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CheckedBoxListTitle"),
      ),
      body: new CheckboxListTile(
        value: _isChecked,
        onChanged: onCheckChange,
        secondary: new Icon(Icons.update,color: Colors.blueAccent,),
        title: new Text("新版本自动下载"),
        subtitle: new Text("仅在WiFi环境下生效"),
      ),
    );
  }
}
