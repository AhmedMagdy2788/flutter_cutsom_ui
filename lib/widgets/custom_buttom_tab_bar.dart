import 'package:flutter/material.dart';

class CustomButtomTabBar extends StatelessWidget {
  const CustomButtomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxWidth * .25,
        child: CustomPaint(foregroundPainter: RPSCustomPainter()),
      );
    });
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0, size.height * 1.0);
    path_0.lineTo(size.width * 0.0010000, size.height * 0.2000000);
    path_0.quadraticBezierTo(size.width * 0.2979200, size.height * 0.0975200,
        size.width * 0.3508000, size.height * 0.0680000);
    path_0.cubicTo(
        size.width * 0.4008000,
        size.height * 0.0490000,
        size.width * 0.4008000,
        size.height * 0.1254000,
        size.width * 0.4008000,
        size.height * 0.2024000);
    path_0.cubicTo(
        size.width * 0.4028000,
        size.height * 0.7524000,
        size.width * 0.6010000,
        size.height * 0.7276000,
        size.width * 0.6000000,
        size.height * 0.2016000);
    path_0.cubicTo(
        size.width * 0.5995000,
        size.height * 0.1226000,
        size.width * 0.6001000,
        size.height * 0.0574000,
        size.width * 0.6501000,
        size.height * 0.0704000);
    path_0.quadraticBezierTo(size.width * 0.7126000, size.height * 0.1054000,
        size.width * 0.9996000, size.height * 0.2008000);
    path_0.lineTo(size.width, size.height * 0.9960000);
    path_0.lineTo(size.width * 0.0002000, size.height * 1.0024000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
