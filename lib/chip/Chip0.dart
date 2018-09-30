import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: Center(
        child: Chip(
          avatar: Icon(Icons.add_location, color: Colors.lightBlue),
          onDeleted: () {},
          deleteIcon: Icon(Icons.delete_forever),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: "删除该条",
          backgroundColor: Colors.lightGreenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          label: Text("flyou"),
        ),
      ),
    );
  }
}
