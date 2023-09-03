import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final path = Path()
      ..moveTo(size.width * 1 / 2, size.height * 1 / 6)
      ..lineTo(size.width * 1 / 6, size.height * 5 / 6)
      ..lineTo(size.width * 5 / 6, size.height * 5 / 6)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TrianglePainter oldDelegate) => false;
}
