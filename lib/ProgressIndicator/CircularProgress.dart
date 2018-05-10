import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("CircularProgressIndicator"),
      ),
      body:Center(child: CircularProgressIndicator(strokeWidth: 10.0,),),
    );
  }
}
