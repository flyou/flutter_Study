import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test1/route/PageB.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      '/pageB': (BuildContext context) => new PageB("I am from Page1"),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PageA"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Future future = Navigator.of(context).pushNamed("/pageB");
            future.then((value) {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return new AlertDialog(
                      title: new Text(value),
                    );
                  });
            });
          },
          child: new Text("点我跳转"),
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
