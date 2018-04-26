import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<int> items = List.generate(10, (i) => i);
  ScrollController _scrollController = new ScrollController();

  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }
  Future<Null> _handleRefresh() async {
    
  await  Future.delayed(Duration(seconds: 5),(){
      print('refresh');
      setState(() {
        items.clear();
        items = List.generate(20, (i) => i);
        return null;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh"),
      ),
      body: new RefreshIndicator(child: ListView.builder(itemCount: items.length,itemBuilder: (context,index){
        return ListTile(title: Text("Index$index"),);
      },), onRefresh: _handleRefresh),
    );
  }
}
