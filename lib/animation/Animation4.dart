import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      })
    ..addStatusListener((status){
      if(status==AnimationStatus.forward){
        print("动画开始");
      }else if(status==AnimationStatus.completed){
        print("动画结束");
        controller.reverse();
      }
      else if (status == AnimationStatus.dismissed) {
        print("动画消失");
        controller.forward();
      }
    });

    controller.forward();
  }

  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(new LogoApp());
}