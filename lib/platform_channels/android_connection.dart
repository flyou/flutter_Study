import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("com.flyou.test/android");
  static const EventChannel eventChannel =
      const EventChannel('com.flyou.test/netChanged');

  var netChangeStr = "点我获取当前网络状态";

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      netChangeStr = event;
    });
  }

  void _onError(Object error) {
    setState(() {
      netChangeStr = "网络状态获取失败";
    });
  }

  Future<bool> isNetConnection() async {
    bool isConnection;
    try {
      isConnection = await platform.invokeMethod("netConnection");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return isConnection;
  }

  showToast(String msg) async {
    try {
      await platform.invokeMethod("showToast", {"msg": msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("platformChannels"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(netChangeStr),
          onPressed: () {
            isNetConnection().then((bool) {
              showToast(bool ? "网络连接成功" : "网络连接失败");
            });
          },
        ),
      ),
    );
  }
}
