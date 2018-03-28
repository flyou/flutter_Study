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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TextField"),
        ),
        body: new TextField(keyboardType: TextInputType.number,
          decoration: new InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              icon: new Icon(Icons.phone),
              labelText: "请输入你的手机号",
              helperText: "注册时填写的手机号码"),
          autofocus: false,
          onChanged: (String str){

          print("用户输入变更:$str");
          },
          onSubmitted: (String str){
          print("用户提交:$str");
          },
        ));
  }
}
