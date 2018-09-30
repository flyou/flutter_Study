import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toolTips"),
      ),
      body: Center(
        child: Tooltip(
          message: "我是提示",
          verticalOffset: 60.0,
          //纵向间隔
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          //padding
          height: 32.0,
          //tip显示的高度
          preferBelow: false,
          child: Builder(builder: (BuildContext context) {
            return RaisedButton(
              onPressed: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("按钮被点击")));
              },
              child: Text("点我"),
            );
          }),
        ),
      ),
    );
  }
}
