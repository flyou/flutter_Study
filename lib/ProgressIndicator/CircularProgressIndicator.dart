import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  double currentProgress = 0.1;

  @override
  Widget build(BuildContext context) {
    onProgressChange() {
      setState(() {
        currentProgress+=0.1;
        if (currentProgress >= 1.0) {
          currentProgress = 0.1;
        }
      });
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text("LinearProgressIndicator"),
      ),
      body: Column(
        children: <Widget>[
          CircularProgressIndicator(
          value: currentProgress,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              onPressed: onProgressChange,
              child: Text("改变进度"),
            ),
          )
        ],
      ),
    );
  }
}
