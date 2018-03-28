import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: new MaterialApp(
    home: new MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("SnackBar"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("Snackbar"),
                      action: new SnackBarAction(
                        label: "撤回",
                        onPressed: () {},
                      ),
                    ));
              },
              child: new Text("点我啊"),
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.lightBlueAccent,
            );
          }),
        ));
  }
}
