import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: LogoFade(),
  ));
}

class LogoFade extends StatefulWidget {
  @override
  createState() => new LogoFadeState();
}

class LogoFadeState extends State<LogoFade>with  SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
   animationController=new AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
   animation=new Tween(begin: 0.0,end: 1.0).animate(animationController);
  }

  _changeOpacity() {
    if(animation.value==1.0){
    animationController.reverse();
  }else{
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new FadeTransition(
          opacity: animation,
          child: new FlutterLogo(size: 100.0,),
        ),
        SizedBox(
          height: 30.0,
        ),
        new RaisedButton(
          child: new Text('GO'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}
