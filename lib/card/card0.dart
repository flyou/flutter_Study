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

          child: Icon(
            Icons.apps,
            size: 50.0,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
