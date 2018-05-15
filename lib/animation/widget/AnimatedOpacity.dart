import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/**
 * 使用AnimatedBuilder来做动画
 */

void main() {
  runApp(new MaterialApp(home: LogoFade(),));
}

class LogoFade extends StatefulWidget {
  @override
  createState() => new LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 0.0;

  _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new AnimatedOpacity(

          duration: new Duration(seconds: 3),
          child: new FlutterLogo(size: 100.0,),
          opacity: opacityLevel,
        ),
        SizedBox(height: 30.0,),
        new RaisedButton(
          child: new Text('Go'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}