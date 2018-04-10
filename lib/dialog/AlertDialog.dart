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
                      builder: (BuildContext context){
                        return new AlertDialog(
                          content: new Text("我是AlertDialog"),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: new Text('确定'))
                          ],
                        );
                      });
                },
                child: new Text("Dialog出来"),
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                disabledColor: Colors.lightBlueAccent);
          }),
        ));
  }
}
