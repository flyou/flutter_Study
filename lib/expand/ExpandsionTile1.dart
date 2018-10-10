import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Color iconColors = Colors.grey;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new Tween(begin: 0.0, end: 0.125).animate(animationController);
  }

  _changeOpacity(bool expand) {
    setState(() {
      if (expand) {
        animationController.forward();
        iconColors = Colors.redAccent;
      } else {
        animationController.reverse();
        iconColors = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ExpandTitle')),
        body: ListView(children: <Widget>[
          const ListTile(title: Text('第一列')),
          ExpansionTile(
              title: const Text('第二列'),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              trailing: RotationTransition(
                turns: animation,
                child: Icon(
                  Icons.add,
                  color: iconColors,
                ),
              ),
              onExpansionChanged: (bool) {
                _changeOpacity(bool);
              },
              children: const <Widget>[
                ListTile(title: Text('One')),
                ListTile(title: Text('Two')),
                ListTile(title: Text('Free')),
                ListTile(title: Text('Four'))
              ]),
          const ListTile(title: Text('第三列')),
          const ListTile(title: Text('第四列')),
          const ListTile(title: Text('第五列')),
          const ListTile(title: Text('第六列')),
          const ListTile(title: Text('第七列')),
          const ListTile(title: Text('第八列')),
        ]));
  }
}
