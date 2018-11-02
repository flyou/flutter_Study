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
    home: PrinterLineDemo(),
  ));
}

class PrinterLineDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PrinterLineDemoState();
  }

}

class PrinterLineDemoState extends State<PrinterLineDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinterLineDemo"),
      ),
      body: Container(child: CustomPaint(painter: LinePainter(),),),
    );
  }
}

class LinePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.redAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(20.0, 20.0), Offset(100.0, 100.0), _paint);
    canvas.drawLine(Offset(100, 100),Offset(100.0, 200.0), _paint);
    canvas.drawLine(Offset(100.0, 200.0),Offset(200.0, 200.0), _paint);
    canvas.drawLine(Offset(200.0, 200.0),Offset(200.0, 100.0), _paint);
    canvas.drawLine(Offset(200.0, 100.0),Offset(280.0, 20.0), _paint);
    canvas.drawLine(Offset(20.0, 20.0),Offset(280.0, 20.0), _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
