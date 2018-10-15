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

class AdCounterView extends StatefulWidget {
  final Color backgroundColor;
  final Color foreColor;
  final int duration;
  final double size;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;

  const AdCounterView(this.size,
      {this.backgroundColor = Colors.grey,
      this.foreColor = Colors.blueAccent,
      this.duration = 3000,
      this.strokeWidth = 10.0,
      this.startAngle = 0.0,
      this.endAngle = 360});

  @override
  State<StatefulWidget> createState() {
    return AdCounterViewState();
  }
}

class AdCounterViewState extends State<AdCounterView>
    with SingleTickerProviderStateMixin {
  AdCounterViewState();

  Animation<double> _doubleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _doubleAnimation = new Tween(begin: 0.0, end: widget.endAngle)
        .animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    onAnimationStart();
  }

  onAnimationStart() {
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: ArcAnimationView(
              widget.backgroundColor,
              widget.foreColor,
              widget.startAngle,
              _doubleAnimation.value,
              widget.endAngle,
              widget.strokeWidth),
          size: Size(widget.size, widget.size),
          child: Center(
            child: Text("${(_doubleAnimation.value / 3.6).round()}%"),
          ),
        ));
  }
}

class ArcAnimationView extends CustomPainter {
  var _paintBckGround;
  var _paintFore;

  final _strokeWidth;
  final _backgroundColor;
  final _foreColor;
  final _startAngle;
  final _sweepAngle;
  final _endAngle;

  ArcAnimationView(this._backgroundColor, this._foreColor, this._startAngle,
      this._sweepAngle, this._endAngle, this._strokeWidth) {
    _paintBckGround = new Paint()
      ..color = _backgroundColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth
      ..style = PaintingStyle.stroke;

    _paintFore = new Paint()
      ..color = _foreColor
      ..isAntiAlias = true
      ..strokeWidth = _strokeWidth - 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width > size.height ? size.width / 2 : size.height / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    canvas.drawCircle(Offset(radius, radius), radius, _paintBckGround);
    canvas.drawArc(rect, _startAngle / 180 * 3.14, _sweepAngle / 180 * 3.14,
        false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return _sweepAngle != _endAngle;
  }
}
