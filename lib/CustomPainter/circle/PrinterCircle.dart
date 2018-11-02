import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘                         
/// Author       : fzl flyou
/// Date         : 2018/10/12 0012
/// ProjectName  : test1
/// Description  :
/// Version      : V1.0
/// ------------------------------

void main() {
  runApp(new MaterialApp(
    home: PrinterCircleDemo(),
  ));
}

class PrinterCircleDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PrinterCircleDemoState();
  }

}

class PrinterCircleDemoState extends State<PrinterCircleDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinterLineDemo"),
      ),
      body: Container(child: CustomPaint(painter: CirclePainter(),),),
    );
  }
}

class CirclePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.redAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style=PaintingStyle.stroke
    ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(100, 100), 80, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
