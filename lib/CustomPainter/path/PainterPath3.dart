import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    home: PainterDemo(),
  ));
}

class PainterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PainterDemoState();
  }
}

class PainterDemoState extends State<PainterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PainterDemo"),
      ),
      body: CustomPaint(
        painter: CirclePainter(),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.arcTo(Rect.fromCircle(center: Offset(100, 100),radius: 80),0,6.28,false);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
}}
