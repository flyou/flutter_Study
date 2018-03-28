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

  int radioValue=0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CheckBox"),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          new Radio(
              value: 0,
              groupValue: radioValue,
              onChanged:  handleRadioValueChanged),
          new Radio(
              value: 1,
              groupValue:radioValue,
              onChanged: handleRadioValueChanged),
          new Radio(
              value: 2,
              groupValue: radioValue,
              onChanged: handleRadioValueChanged),
          new Radio(
              value: 3,
              groupValue: radioValue,
              onChanged: handleRadioValueChanged)
        ],
      )),
    );
  }
}
