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
    return PrinterArcDemoState();
  }
}

class PrinterArcDemoState extends State<PrinterLineDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PrinterLineDemo"),
        ),
        body: CustomPaint(painter: LineArc()));
  }
}

class LineArc extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.redAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    double PI = 3.1415926;
    var sweepAngle = PI / 2;
    Rect rect = Rect.fromCircle(center: Offset(100.0, 100), radius: 80);
    canvas.drawArc(rect, 0, sweepAngle, true, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
