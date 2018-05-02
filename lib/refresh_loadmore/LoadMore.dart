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
  bool isLoading = false;
  List<int> items = List.generate(15, (i) => i);
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("loadMore");
        _getMoreData();
      }
    });
  }
  Future _getMoreData() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      List<int> newEntries = await fakeRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isLoading = false;
      });
    }
  }
  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget _buildProgressIndicator() {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new Opacity(
            opacity: isLoading ? 1.0 : 0.0,
            child: new CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("LoadMore"),
      ),
      body:  ListView.builder(
          itemCount: items.length+1,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return   _buildProgressIndicator();
            } else {
              return ListTile(
                  title: Text("Index$index"));
            }
          },
          controller: _scrollController,
        )
    );
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}


