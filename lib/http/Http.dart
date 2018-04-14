import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(home: new MyApp(),));
}

class MyApp extends StatelessWidget {
  void httpGet() {
    print("请求开始");
    http.get("https://api.github.com/users/flyou").then((response) {
      print("请求结果："+response.body);
    }).catchError((error) {
      print("请求出错：" + error.toString());
    }).whenComplete(() {
      print("请求完成");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络操作"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {httpGet();},
          child: Text("获取用户信息"),
        ),
      ),
    );
  }
}
