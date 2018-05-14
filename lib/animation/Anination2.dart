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
    numberAnimation = new Tween(begin: 0.0, end: 100.0).animate(controller);
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
        child: AnimationText(animation: numberAnimation,),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimationText extends AnimatedWidget {
  AnimationText({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Text(animation.value.toInt().toString());
  }
}
