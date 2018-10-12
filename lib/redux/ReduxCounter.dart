import 'package:flutter/material.dart';

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘
/// Author       : fzl flyou
/// Date         : 2018/10/11 0011
/// ProjectName  : test1
/// Description  :
/// Version      : V1.0
/// ------------------------------

void main() {
  runApp(new MaterialApp(
    home: ReduxCounterDemo(),
  ));
}

class ReduxCounterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReduxCounterDemoState();
  }
}

class ReduxCounterDemoState extends State<ReduxCounterDemo> {
  var counter = 0;

  _onPressed() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReduxCounterDemo"),
      ),
      body: Center(
        child: Text(
          "you have pressed $counter time",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onPressed();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
