import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: TestDemo(),
  ));
}

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestDemo"),
      ),
      body: Container(),
    );
  }
}
