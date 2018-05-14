import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double> numberAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    numberAnimation = new Tween(begin: 0.0, end: 100.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  onAnimationStart() {
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: onAnimationStart,
        child: Text(numberAnimation.value.toInt().toString()),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

