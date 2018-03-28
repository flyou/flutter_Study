import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Icons"),
        ),
        body: new Container(
          alignment: Alignment.center,
          width: 300.0,
          height: 300.0,
    constraints: new BoxConstraints.expand(
    height: 100.0,),
transform: new Matrix4.skewX(0.2),
          decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://pic.58pic.com/00/94/40/02bOOOPIC2e.jpg"),fit:BoxFit.fill )),
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          child: new Text(
              "在前面的文章中我们学习了Flutter Icon的用法，介绍了Icon加载图片的两种方式，文章的最后让大家实现从阿里的iconfont获取图标并在程序内加载来自iconfont的字体。"),
        ));
  }
}
