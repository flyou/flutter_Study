import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatelessWidget {
  final _userNameController = new TextEditingController();


  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "name.db");

    return path;
  }

  Future<Database> get _localFile async {
    final path = await _dbPath;

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              "CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
        });
    return database;
  }

  Future<int> save(String name) async {
    final db = await _localFile;
    return db.transaction((trx){
      trx.rawInsert( 'INSERT INTO user(name) VALUES("$name")');
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Map>> get() async {
      final db = await _localFile;
      List<Map> list=    await db.rawQuery('SELECT * FROM user');
      return list;
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
                      Future<List<Map>> userName = get();
                      userName.then((List<Map> userNames) {
                        Scaffold.of(context).showSnackBar(
                            new SnackBar(content: Text("数据获取成功：$userNames")));
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
