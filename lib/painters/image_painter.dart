import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ImagePainter oldDelegate) => false;
}
