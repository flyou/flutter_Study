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
      body: Center(child: Chip(
        label: Text("flyou"),
        onDeleted: () {},
        avatar: Icon(Icons.security,color: Colors.lightGreenAccent,),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        labelPadding: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "删除该条",
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
        backgroundColor: Colors.blueAccent,

        materialTapTargetSize: MaterialTapTargetSize.padded,//Material阴影
      ),),
    );
  }
}
