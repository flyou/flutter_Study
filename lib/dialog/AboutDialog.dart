import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Dialog"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      child: new AboutDialog(
                        applicationName: "最佳助手：",
                        applicationVersion: "V1.0",
                        applicationIcon: new Icon(Icons.android,color: Colors.blueAccent,),
                        children: <Widget>[new Text("更新摘要\n新增飞天遁地功能\n优化用户体验")],
                      ));
                },
                child: new Text("Dialog出来"),
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                disabledColor: Colors.lightBlueAccent);
          }),
        ));
  }
}
