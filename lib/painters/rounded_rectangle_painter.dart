import 'package:flutter/material.dart';

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromPoints(
        Offset(size.width * 1 / 6, size.height * 1 / 6),
        Offset(size.width * 5 / 6, size.height * 5 / 6));
    const radius = Radius.circular(32);
    final rrect = RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(RoundedRectanglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RoundedRectanglePainter oldDelegate) => false;
}
