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
   showToast(String msg) async {
    try {
    await platform.invokeMethod("showToast",{"msg":msg});
    } on PlatformException catch (e) {
     print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("platformChannels"),),body:  Center(
      child: RaisedButton(
        child: Text("点我提示"),
        onPressed: () {
          showToast("我是android系统的toast");
        },
      ),
    ),);
  }
}
