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
      body: Center(child: CustomPaint(painter: LineArc(),size: Size(200.0, 100.0),),),
    );
  }
}

class LineArc extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style=PaintingStyle.stroke

    ..strokeWidth = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
   Rect rect= Rect.fromCircle(center: Offset(100.0, 0.0),radius: size.width/2);
var sweepAngle=270/180*3.14;

    canvas.drawCircle( Offset(100.0, 0.0), size.width/2, _paint);
    _paint.color=Colors.amberAccent;
    _paint.strokeWidth=7.0;
    canvas.drawArc(rect, 0,sweepAngle,false,_paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
