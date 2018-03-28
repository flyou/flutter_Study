import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("layout"),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(
                color: Colors.grey,
              )),
            ),
            child: new Row(children: <Widget>[
              new Icon(
                Icons.chat,
                color: Colors.lightBlueAccent,
              ),
              new Expanded(
                child: new Text(
                  "消息记录",
                  textAlign: TextAlign.right,
                ),
              )
            ]),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(
                color: Colors.grey,
              )),
            ),
            child: new Row(children: <Widget>[
              new Icon(
                Icons.stars,
                color: Colors.lightBlueAccent,
              ),
              new Expanded(
                child: new Text(
                  "我的收藏",
                  textAlign: TextAlign.right,
                ),
              )
            ]),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(
                color: Colors.grey,
              )),
            ),
            child: new Row(children: <Widget>[
              new Icon(
                Icons.lock,
                color: Colors.lightBlueAccent,
              ),
              new Expanded(
                child: new Text(
                  "我的账户",
                  textAlign: TextAlign.right,
                ),
              )
            ]),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(
                color: Colors.grey,
              )),
            ),
            child: new Row(children: <Widget>[
              new Icon(
                Icons.send,
                color: Colors.lightBlueAccent,
              ),
              new Expanded(
                child: new Text(
                  "意见反馈",
                  textAlign: TextAlign.right,
                ),
              )
            ]),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(
                color: Colors.grey,
              )),
            ),
            child: new Row(children: <Widget>[
              new Icon(
                Icons.settings,
                color: Colors.lightBlueAccent,
              ),
              new Expanded(
                child: new Text(
                  "系统设置",
                  textAlign: TextAlign.right,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

