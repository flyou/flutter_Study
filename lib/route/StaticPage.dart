import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page1"),
      ),
      body: new Center(
        child: new Text("登录成功")),
    );
  }
}
