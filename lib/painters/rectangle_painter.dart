import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromPoints(
        Offset(size.width * 1 / 6, size.height * 1 / 6),
        Offset(size.width * 5 / 6, size.height * 5 / 6));
    canvas.drawRect(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
