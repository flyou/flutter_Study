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
  bool _first = true;

  _changeOpacity() {
    setState(() => _first = _first == false ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
          crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        SizedBox(height: 30.0,),
        new RaisedButton(
          child: new Text('GO'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}