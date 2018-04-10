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
  final List<ListItem> listData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return new ListItemWidget(listData[index]);
        },
        itemCount: listData.length,
      ),
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        color: Colors.blue,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(listItem.iconData, size: 50.0),
            new Text(listItem.title)
          ],
        ),
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(listItem.title),
        ));
      },
    );
  }
}