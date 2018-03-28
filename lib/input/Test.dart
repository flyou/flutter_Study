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
      _isChecked = isChecked;
    });
  }

  int radioValue = 0;

  void onRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  var isSwitch = true;

  onSwitchChange(bool isChecked) {
    setState(() {
      isSwitch = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Test")),
      body: new Column(
        children: <Widget>[
          new CheckboxListTile(
            value: _isChecked,
            onChanged: onCheckChange,
            secondary: new Icon(
              Icons.update,
              color: Colors.blueAccent,
            ),
            title: new Text("新版本自动下载"),
            subtitle: new Text("仅在WiFi环境下生效"),
          ),
          new Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          new RadioListTile(
            value: 0,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("10分钟"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new RadioListTile(
            value: 1,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("30分钟"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new RadioListTile(
            value: 2,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("1个小时"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          new SwitchListTile(
            value: isSwitch,
            onChanged: onSwitchChange,
            title: new Text("新消息提醒"),
            secondary: new Icon(
              Icons.message,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
