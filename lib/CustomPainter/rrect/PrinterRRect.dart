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
    home: PrinterOvalDemo(),
  ));
}

class PrinterOvalDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PrinterOvalDemoState();
  }
}

class PrinterOvalDemoState extends State<PrinterOvalDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinterOvalDemo"),
      ),
      body: Container(
        child: CustomPaint(
          painter: OvalPainter(new Paint()
            ..color = Colors.redAccent
            ..strokeCap = StrokeCap.round
            ..isAntiAlias = true
            ..style = PaintingStyle.stroke
            ..strokeWidth = 5.0),
        ),
      ),
    );
  }
}

class OvalPainter extends CustomPainter {
  var _paint;

  OvalPainter(this._paint);

  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(60.0));
    canvas.drawRRect(rRect, _paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
