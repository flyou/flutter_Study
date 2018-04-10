import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  final _userNameController = new TextEditingController();
  final mFile=null;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/nameFile.txt');
  }

  Future<File> save(String name) async {
    final file = await _localFile;
    return file.writeAsString(name);
  }

  @override
  Widget build(BuildContext context) {
    Future<String> get() async {
      final file = await _localFile;
      return file.readAsString();
    }

    return new Builder(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("FileOperator"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new Column(
              children: <Widget>[
                new TextField(
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
                      save(_userNameController.text.toString());
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
