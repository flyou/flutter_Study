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
                      child: new SimpleDialog(
                        contentPadding: const EdgeInsets.all(10.0),
                        title: new Text("我是标题"),
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(Icons.apps),
                            title: new Text("apps"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.android),
                            title: new Text("andrpid"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.cake),
                            title: new Text("cake"),
                          ),
                          new ListTile(
                            leading: new Icon(Icons.local_cafe),
                            title: new Text("cofe"),
                          ),
                        ],
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
