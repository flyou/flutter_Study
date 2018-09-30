import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MyChip> listData = [];
  final List<Icon> icons = [];

  Color _randomColor() {

    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }

  @override
  void initState() {
    super.initState();

    icons.add(Icon(Icons.delete_forever, color: _randomColor()));
    icons.add(Icon(Icons.message, color: _randomColor()));
    icons.add(Icon(Icons.print, color: _randomColor()));
    icons.add(Icon(Icons.add, color: _randomColor()));
    icons.add(Icon(Icons.security, color: _randomColor()));
    icons.add(Icon(Icons.cake, color: _randomColor()));
    icons.add(Icon(Icons.http, color: _randomColor()));
    icons.add(Icon(Icons.location_city, color: _randomColor()));
    icons.add(Icon(Icons.apps, color: _randomColor()));
    for (int i = 0; i < 20; i++) {
      listData.add(new MyChip("add$i", _randomColor(),
          icons[Random.secure().nextInt(icons.length)], _removeChip));
    }
  }

  void _removeChip(MyChip chip) {
    setState(() {
      listData.remove(chip);
    });
  }

  void _addChip(MyChip chip) {
    setState(() {
      listData.add(chip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                _addChip(MyChip("add", _randomColor(),
                    icons[Random.secure().nextInt(icons.length)], _removeChip));
              })
        ],
      ),
      body: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: listData,
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final tipText;
  final color;
  final avatar;

  var callback;

  MyChip(this.tipText, this.color, this.avatar, this.callback);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tipText),
      onDeleted: () {
        callback(this);
      },
      avatar: avatar,
      labelStyle: TextStyle(
        color: color,
      ),
      deleteIconColor: color,
      deleteButtonTooltipMessage: "删除该条",
    );
  }
}
