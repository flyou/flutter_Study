import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toolTips"),
      ),
      body: Center(
        child: Tooltip(
          message: "点我干啥",
          child: MyButton("我是按钮"),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(text),
          action: new SnackBarAction(
            label: "撤回",
            onPressed: () {},
          ),
        ));
      },
      child: Text(text),
    ));
  }
}
