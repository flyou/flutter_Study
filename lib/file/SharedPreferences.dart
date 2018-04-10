import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}



class MyApp extends StatelessWidget {
  final String mUserName = "userName";
  final _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    save() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(mUserName, _userNameController.value.text.toString());
    }

    Future<String> get() async {
      var userName;

        SharedPreferences prefs = await SharedPreferences.getInstance();
         userName = prefs.getString(mUserName);
      return userName;
    }

    return new Builder(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("SharedPreferences"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context){
            return
                Column(
                  children: <Widget>[
                     TextField(
                      controller: _userNameController,
                      decoration: new InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          icon: new Icon(Icons.perm_identity),
                          labelText: "请输入用户名",
                          helperText: "注册时填写的名字"),
                    ),
                    RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("存储"),
                        onPressed: () {
                          save();
                          Scaffold.of(context).showSnackBar(
                              new SnackBar(content: new Text("数据存储成功")));
                        }),
                    RaisedButton(
                        color: Colors.greenAccent,
                        child: Text("获取"),
                        onPressed: () {
                          Future<String> userName = get();
                          userName.then((String userName) {
                            Scaffold.of(context).showSnackBar(
                                new SnackBar(content: Text("数据获取成功：$userName")));
                          });
                        }),
                  ],
                );
          }),
        ),
      );
    });
  }
}
