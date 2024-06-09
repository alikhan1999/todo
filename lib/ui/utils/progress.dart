import 'dart:math';

import 'package:flutter/material.dart';


class LoaderPaint extends CustomPainter {
  final double percentage;
  const LoaderPaint({
    required this.percentage,
  });

  deg2Rand(double deg) => deg * pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final sweepAngle = deg2Rand(360 * percentage);
    final theta = deg2Rand(-90) + sweepAngle;

    final midOffset = Offset(radius, radius);
    final endOffset = Offset(radius + radius * cos(theta), radius + radius * sin(theta));

    final midEndDiff = sqrt(pow(endOffset.dx - midOffset.dx, 2) + pow(endOffset.dy - midOffset.dy, 2));

    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(midOffset.dy, 10),
      Offset(midOffset.dy,-10),
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: midOffset, width: size.width, height: size.height),
      deg2Rand(-90),
      sweepAngle,
      false,
      paint,
    );
    canvas.drawLine(
      Offset(endOffset.dx + (10/midEndDiff) * (endOffset.dx - midOffset.dx), endOffset.dy + (10/midEndDiff) * (endOffset.dy - midOffset.dy)),
      Offset(endOffset.dx - (10/midEndDiff) * (endOffset.dx - midOffset.dx), endOffset.dy - (10/midEndDiff) * (endOffset.dy - midOffset.dy)),
      paint,
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
