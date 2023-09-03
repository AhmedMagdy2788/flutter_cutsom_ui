import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        (size.width > size.height) ? size.height / 3 : size.width / 3, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}
