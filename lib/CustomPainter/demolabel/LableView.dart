import 'dart:ui';
import 'package:flutter/material.dart';

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘
/// Author       : fzl flyou
/// Date         : 2018/10/12 0012
/// ProjectName  : test1
/// Description  : labelView
/// Version      : V1.0
/// ------------------------------

class LabelView extends StatefulWidget {
  final Size size;
  final String labelText;
  final TextStyle textStyle;
  final Color labelColor;
  final Color backgroundColor;
  final bool useAngle;
  final labelAlignment;

  final Widget child;

  LabelView(this.child, this.size,
      {this.labelColor = Colors.blue,
      this.labelText = "HOT",
      this.useAngle = true,
      this.backgroundColor = Colors.transparent,
      this.labelAlignment = LabelAlignment.leftTop,
      this.textStyle});

  @override
  State<StatefulWidget> createState() {
    return LabelViewState();
  }
}

class LabelViewState extends State<LabelView> {
  static final double PI = 3.1415926;
  var textAngle;
  var textAlignment;

  var offset;

  @override
  Widget build(BuildContext context) {
    var offsetX = widget.size.width > widget.size.height
        ? widget.size.height / 4.5
        : widget.size.width / 4.5;
    switch (widget.labelAlignment) {
      case LabelAlignment.leftTop:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.topLeft;
        textAngle = -PI / 4;
        break;
      case LabelAlignment.rightTop:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.topRight;
        textAngle = PI / 4;
        break;
      case LabelAlignment.leftBottom:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.bottomLeft;
        textAngle = PI / 4;
        break;
      case LabelAlignment.rightBottom:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.bottomRight;
        textAngle = -PI / 4;
        break;
    }

    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          widget.child,
          CustomPaint(
            size: widget.size,
            painter: LabelViewPainter(
                widget.labelColor, widget.labelAlignment, widget.useAngle),
            child: Align(
                alignment: textAlignment,
                child: Transform.rotate(
                  angle: textAngle,
                  child: Text(
                    widget.labelText,
                    style: widget.textStyle == null
                        ? TextStyle(color: Colors.white)
                        : widget.textStyle,
                  ),
                  origin: offset,
                )),
          )
        ],
      ),
      width: widget.size.width,
      height: widget.size.height,
    );
  }
}

class LabelViewPainter extends CustomPainter {
  var labelColor;
  var labelAlignment;
  var useAngle;
  var _paint;

  LabelViewPainter(this.labelColor, this.labelAlignment, this.useAngle) {
    _paint = new Paint()
      ..color = labelColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var drawSize = size.height > size.width ? size.width / 2 : size.height / 2;
    Path path = new Path();

    switch (labelAlignment) {
      case LabelAlignment.leftTop:
        if (!useAngle) {

          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);
        }
        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);

        break;
      case LabelAlignment.leftBottom:

        path.moveTo(0, size.height - drawSize);

      if(useAngle){
        path.lineTo(drawSize, size.height);
        path.lineTo(0, size.height);
      }else{
        path.lineTo(0, size.height-drawSize/2);
        path.lineTo(drawSize/2, size.height);
        path.lineTo(drawSize, size.height);
      }

        break;
      case LabelAlignment.rightTop:
        path.moveTo(size.width - drawSize, 0);
        if (useAngle) {
          path.lineTo(size.width, 0);

        }else{
          path.lineTo(size.width - drawSize / 2, 0);
          path.lineTo(size.width, drawSize / 2);
        }

        path.lineTo(size.width, drawSize);
        break;
      case LabelAlignment.rightBottom:
        if(useAngle){
          path.moveTo(size.width, size.height);

          path.lineTo(size.width - drawSize, size.height);
          path.lineTo(size.width, size.height - drawSize);
        }else{
          path.moveTo(size.width-drawSize, size.height);
          path.lineTo(size.width - drawSize/2, size.height);
          path.lineTo(size.width, size.height - drawSize/2);
          path.lineTo(size.width, size.height - drawSize);
        }

        break;
      default:
        if (!useAngle) {

          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);
        }
        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);
        break;
    }

    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LabelAlignment {
  int labelAlignment;

  LabelAlignment(this.labelAlignment);

  static const leftTop = 0;
  static const leftBottom = 1;
  static const rightTop = 2;
  static const rightBottom = 3;
}
