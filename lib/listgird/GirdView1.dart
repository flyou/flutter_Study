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
        title: new Text("GridView"),
      ),
      body: new GridView(
        children: <Widget>[
          new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),
          new Container(

            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),new Container(
            child: new Icon(
              Icons.cake,
              size: 50.0,
            ),
            color: Colors.blue,
          ),
        ],
        reverse: false,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0),
      ),
    );
  }
}
