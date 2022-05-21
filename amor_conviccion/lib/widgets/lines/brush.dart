import 'package:flutter/material.dart';

class Painter3 extends CustomPainter {
  //Draw start point
  var _start;
  //Draw end point
  var _end;

  Painter3(this._start, this._end);

  @override
  void paint(Canvas canvas, Size size) {
    //Brush properties
    var _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    //Draw line
    canvas.clipRect(Offset.zero & size);
    canvas.drawLine(_start.value, _end.value, _paint);
  }

  @override
  bool shouldRepaint(Painter3 oldDelegate) {
    return true;
  }
}