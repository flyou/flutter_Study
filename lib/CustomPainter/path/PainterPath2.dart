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
  static final double _strokeWidth = 5.0;
  final double radius = 15;
  final double lineHeight = 50;
  final double startX = 150.0;
  double startY = 150.0;

  Paint _paint = new Paint()
    ..color = Colors.redAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = _strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();

    //直线

    canvas.drawCircle(Offset(startX, startY - radius), radius, _paint);
    _paint.color = Colors.blueAccent;
    path.moveTo(startX, startY);
    path.lineTo(startX, startY + lineHeight);

    canvas.drawPath(path, _paint);
    canvas.save();
    canvas.drawCircle(
        Offset(startX, (startY + lineHeight + radius).floorToDouble()),
        radius,
        _paint);
    canvas.save();
    startY = startY + lineHeight + radius * 2;
    path.reset();
    path.moveTo(startX, startY);
    path.lineTo(startX, startY + lineHeight);
    canvas.drawPath(path, _paint);
    canvas.save();
    canvas.drawCircle(
        Offset(startX, (startY + lineHeight + radius).floorToDouble()),
        radius,
        _paint);
    canvas.save();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
