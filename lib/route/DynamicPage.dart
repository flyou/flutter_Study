import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
final userName;

DynamicPage(this.userName);

@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DynamicPage"),
      ),
      body: new Center(
        child: new Text("登录成功，欢迎新用户:$userName")),
    );
  }
}
