import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  final title;

  PageB(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page2"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("点我返回"),
          onPressed: () {
            Navigator.of(context).pop("我是第二个页面返回的数据：$title");
          },
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
