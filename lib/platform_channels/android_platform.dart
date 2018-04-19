import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel("com.flyou.test/android");

  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("platformChannels"),
      ),
      body: new Center(
        child: new Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              getAndroidTime().then((str){
                Scaffold.of(context).showSnackBar(new SnackBar(content:Text(str!=null?str:"获取失败")));
              });
            },
            child: Text("点我获取Android平台数据"),
          );
        }),
      ),
    );
  }
}
