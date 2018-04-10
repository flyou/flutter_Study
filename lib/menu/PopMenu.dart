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
  final List<PopItem> listData = [];

  @override
  void initState() {
    super.initState();
    listData.add(new PopItem("app", Icons.apps));
    listData.add(new PopItem("cake", Icons.cake));
    listData.add(new PopItem("school", Icons.school));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PopMenu"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.refresh), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.add_a_photo), onPressed: () {}),
          new PopupMenuButton(itemBuilder: (BuildContext context) {
            return listData.map((PopItem popItem) {
              return new PopupMenuItem(
                child: new MyPopItemWidget(popItem),
                value: popItem,
              );
            }).toList();
          })
        ],
      ),
    );
  }
}

class PopItem {
  final title;
  final icon;

  PopItem(this.title, this.icon);
}

class MyPopItemWidget extends StatelessWidget {
  final popItem;

  MyPopItemWidget(this.popItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(popItem.icon),
      title: new Text(popItem.title),
    );
  }
}
