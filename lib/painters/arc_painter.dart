import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    var centerOffset = sqrt(70 * 70 - 50 * 50);

    canvas.drawCircle(
        Offset(size.width * .2 + 50, size.height * .2 - centerOffset),
        70,
        paintBackground);
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * .2, size.height * .2);
    path.arcToPoint(
      Offset(size.width * .8, size.height * .2),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    path.arcToPoint(Offset(size.width * .2 + 100, size.height * .2),
        radius: const Radius.circular(70),
        rotation: 45,
        largeArc: false,
        clockwise: false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ArcPainter oldDelegate) => false;
}
