import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyCard(),
  ));
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCard"),
      ),
      body: new Center(
        child: Card(
          color: Colors.blue,
          elevation: 5.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: SizedBox(
            width: 200.0,
            height: 100.0,
            child: Icon(
              Icons.apps,
              size: 50.0,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
