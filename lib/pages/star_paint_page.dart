import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/my_layout_tab.dart';

class StarPaintPage extends StatefulWidget {
  const StarPaintPage({super.key});

  @override
  State<StarPaintPage> createState() => _StarPaintPageState();
}

class _StarPaintPageState extends State<StarPaintPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController object and specify the duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // Create an Animation<double> object from the AnimationController object
    // using a Tween class
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the AnimationController object
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
      child: RotationTransition(
          turns: _animation, child: CustomPaint(painter: StarPainter())),
    );
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const piDegreeRatio = pi / 180;
    getAngelRadian(double angleDegree) => angleDegree * piDegreeRatio;
    sinD(double angleInDegree) => sin(getAngelRadian(angleInDegree));
    cosD(double angleInDegree) => cos(getAngelRadian(angleInDegree));
    final w = size.width;
    final h = size.height;
    final r = min(w, h) / 2;
    final x = r * cosD(18) / (1 + sinD(18));
    final z = x * sinD(18) / sinD(36);
    final center = Offset(r, r);
    final path = Path();
    path.moveTo(r, 0);
    for (var i = 1; i < 11; i += 2) {
      path.lineTo(r - z * sinD(i * 36), r - z * cosD(i * 36));
      path.lineTo(r - r * sinD((i + 1) * 36), r - r * cosD((i + 1) * 36));
    }
    // path.lineTo(r - z * sinD(1 * 36), r - z * cosD(1 * 36));
    // path.lineTo(r - r * sinD(2 * 36), r - r * cosD(2 * 36));
    // path.lineTo(r - z * sinD(3 * 36), r - z * cosD(3 * 36));
    // path.lineTo(r - r * sinD(4 * 36), r - r * cosD(4 * 36));
    // path.lineTo(r - z * sinD(5 * 36), r - z * cosD(5 * 36));
    // path.lineTo(r - r * sinD(6 * 36), r - r * cosD(6 * 36));
    // path.lineTo(r - z * sinD(7 * 36), r - z * cosD(7 * 36));
    // path.lineTo(r - r * sinD(8 * 36), r - r * cosD(8 * 36));
    // path.lineTo(r - z * sinD(9 * 36), r - z * cosD(9 * 36));
    // path.lineTo(r - r * sinD(0 * 36), r - r * cosD(0 * 36));
    // path.close();

    final startPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final circulePant = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange;
    canvas.drawPoints(
        PointMode.points,
        [center],
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 2);
    canvas.drawCircle(center, r, circulePant);
    canvas.drawPath(path, startPaint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(StarPainter oldDelegate) => false;
}
