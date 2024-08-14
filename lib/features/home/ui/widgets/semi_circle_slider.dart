import 'dart:math';

import 'package:flutter/material.dart';

class SemiCircularProgressBar extends CustomPainter {
  final double progress;

  SemiCircularProgressBar(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint baseArcPaint = Paint()
      ..color = Colors.brown.shade100
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressArcPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = min(size.width / 2, size.height / 2);

    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, pi, pi, false, baseArcPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
