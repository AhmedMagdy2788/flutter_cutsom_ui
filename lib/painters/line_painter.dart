import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 10;
    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 1 / 6),
      Offset(size.width * 5 / 6, size.height * 1 / 6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 5 / 6, size.height * 1 / 6),
      Offset(size.width * 5 / 6, size.height * 5 / 6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 5 / 6, size.height * 5 / 6),
      Offset(size.width * 1 / 6, size.height * 5 / 6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 5 / 6),
      Offset(size.width * 1 / 6, size.height * 1 / 6),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
