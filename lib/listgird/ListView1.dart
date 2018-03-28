import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(home: new MyApp()),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(
              Icons.cake,
            ),
            title: new Text("我是标题"),
          ), new ListTile(
            leading: new Icon(
              Icons.android,
            ),
            title: new Text("我是标题"),
          ), new ListTile(
            leading: new Icon(
              Icons.apps,
            ),
            title: new Text("我是标题"),
          ), new ListTile(
            leading: new Icon(
              Icons.account_circle,
            ),
            title: new Text("我是标题"),
          )
        ],
      ),
    );
  }
}
