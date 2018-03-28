import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userPasswordController = new TextEditingController();

  void onTextClear() {
    setState(() {
      _userNameController.text = "";
      _userPasswordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TextField"),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: _userNameController,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  icon: new Icon(Icons.perm_identity),
                  labelText: "请输入用户名",
                  helperText: "注册时填写的名字"),
            ),
            new TextField(
              controller: _userPasswordController,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  icon: new Icon(Icons.lock),
                  labelText: "请输入密码",
                  helperText: "登录密码"),
              obscureText: true,
            ),
            new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                  onPressed: () {
                    if (_userNameController.text.toString() == 'flyou' &&
                        _userPasswordController.text.toString() == 'admin') {
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: new Text("登录成功")));
                    } else {
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: new Text("登录失败，用户名密码有误")));
                    }
                    onTextClear();
                  },
                  color: Colors.blue,
                  highlightColor: Colors.lightBlueAccent,
                  disabledColor: Colors.lightBlueAccent,
                  child: new Text(
                    "登录",
                    style: new TextStyle(color: Colors.white),
                  ));
            })
          ],
        ));
  }
}
