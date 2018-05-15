import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(home: LogoFade(),));
}

class LogoFade extends StatefulWidget {
  @override
  createState() => new LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double animValue = 100.0;

  _changeValue() {
    setState(() => animValue = animValue == 0 ? 100.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new AnimatedContainer(

          curve: Curves.bounceOut,
          duration: new Duration(seconds: 3),
          child: new FlutterLogo(size: 100.0,),
          padding: EdgeInsets.only(bottom: animValue),
        ),
        SizedBox(height: 30.0,),
        new RaisedButton(
          child: new Text('GO'),
          onPressed: _changeValue,
        ),
      ],
    );
  }
}