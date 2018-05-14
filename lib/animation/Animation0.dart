import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double> doubleAnimation;
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("AnimAtion"),),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed:onAnimationStart),);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    doubleAnimation =
        new Tween(begin: 0.0, end: 100.0).animate(animationController)..addListener((){
          print(doubleAnimation.value);
        });

  }

  onAnimationStart() {
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}