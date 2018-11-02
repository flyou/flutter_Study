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
    home: PrinterColorDemo(),
  ));
}

class PrinterColorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PrinterColorDemoState();
  }

}

class PrinterColorDemoState extends State<PrinterColorDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinterLineDemo"),
      ),
      body:
         CustomPaint(painter: LineColor()),
    );
  }
}

 class LineColor extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke

    ..strokeWidth = 10.0;

  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawCircle(Offset(100, 100), 80.0, _paint);

    canvas.drawColor(Colors.red, BlendMode.colorDodge);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
