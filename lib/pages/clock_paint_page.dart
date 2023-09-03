import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/my_layout_tab.dart';

class ClockPaintPage extends StatefulWidget {
  const ClockPaintPage({super.key});

  @override
  State<ClockPaintPage> createState() => _ClockPaintPageState();
}

class _ClockPaintPageState extends State<ClockPaintPage> {
  late Timer _timer;
  late DateTime time;

  @override
  void initState() {
    time = DateTime.now();
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
        color: const Color(0xFF2D2F41),
        child: CustomPaint(
          painter: ClockPainter(time),
        ));
  }
}

class ClockPainter extends CustomPainter {
  DateTime time;
  ClockPainter(this.time);

  final double _oneMinuteRadian = 2 * pi / 60;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final raduis = min(centerX, centerY) * .8;
    canvas.drawCircle(
      center,
      raduis,
      Paint()..color = const Color(0xff444974),
    );
    drawRingCircle(canvas, center, raduis);
    drawDashes(canvas, center, raduis);
    drawSecondArm(canvas, center, time);
    drawMinuteArm(canvas, center, time);
    drawHourArm(canvas, center, time);
    drawCenterCircle(canvas, center, size.width * .05);
  }

  void drawText(Canvas canvas, Offset offset, String text) {
    // In your paint method
// Create a paragraph style
    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.center,
      fontSize: 32,
    );

// Create a text style
    final textStyle = ui.TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.bold,
    );

// Create a paragraph builder
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(text);

// Build a paragraph
    final paragraph = paragraphBuilder.build();

// Layout the paragraph
    paragraph.layout(const ui.ParagraphConstraints(width: 40));

// Draw the paragraph on a canvas
    canvas.drawParagraph(paragraph, Offset(offset.dx - 20, offset.dy - 20));
  }

  void drawDashes(Canvas canvas, Offset center, double raduis) {
    double dL = 15;
    final paint = Paint()..color = Colors.white70;
    String text = "";
    for (var i = 1; i <= 60; i++) {
      if (i % 5 == 0) {
        paint.strokeWidth = 3;
        dL = 25;
        int number = ((i ~/ 5)) % 13;
        text = number.toString();
      } else {
        paint.strokeWidth = 2;
        dL = 15;
        text = '';
      }
      final angle = i * _oneMinuteRadian;
      final sinAngle = sin(angle);
      final cosAngle = cos(angle);
      final pX = center.dx + (raduis + 8) * sinAngle;
      final pY = center.dy - (raduis + 8) * cosAngle;
      var armStartOffset = Offset(pX, pY);
      final pXL = center.dx + (raduis + 8 + dL) * sinAngle;
      final pYL = center.dy - (raduis + 8 + dL) * cosAngle;
      var armEndOffset = Offset(pXL, pYL);
      canvas.drawLine(armStartOffset, armEndOffset, paint);

      final pXT = center.dx + (raduis + 8 + dL + 20) * sinAngle;
      final pYT = center.dy - (raduis + 8 + dL + 20) * cosAngle;
      var textOffset = Offset(pXT, pYT);
      drawText(canvas, textOffset, text);
    }
  }

  void drawRingCircle(Canvas canvas, Offset center, double raduis) {
    final outerRingPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, raduis, outerRingPaint);
  }

  void drawSecondArm(Canvas canvas, Offset center, DateTime time) {
    final angle = _oneMinuteRadian * (time.second);

    final paint = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    drawArm(
        angle: angle,
        canvas: canvas,
        center: center,
        paint: paint,
        armLength: 90);
  }

  void drawHourArm(Canvas canvas, Offset center, DateTime time) {
    final minuteFractionAngle = time.minute * 5 / 60;
    final angle = _oneMinuteRadian * (time.hour * 5 + minuteFractionAngle);
    const double armLength = 60;
    final pX = center.dx + armLength * sin(angle);
    final pY = center.dy - armLength * cos(angle);
    var hourArmOffset = Offset(pX, pY);
    final paintgradient = Paint()
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
        center,
        hourArmOffset,
        [
          Colors.deepPurple,
          Colors.purple.shade300,
        ],
      );
    canvas.drawLine(center, hourArmOffset, paintgradient);
  }

  void drawMinuteArm(Canvas canvas, Offset center, DateTime time) {
    final angle = _oneMinuteRadian * (time.minute);
    const double armLength = 80;
    final pX = center.dx + armLength * sin(angle);
    final pY = center.dy - armLength * cos(angle);
    var minuteArmOffset = Offset(pX, pY);
    final paintgradient = Paint()
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
        center,
        minuteArmOffset,
        [
          Colors.blue.shade800,
          Colors.blue.shade200,
        ],
      );
    canvas.drawLine(center, minuteArmOffset, paintgradient);
  }

  void drawArm(
      {required Canvas canvas,
      required Paint paint,
      required Offset center,
      required double armLength,
      required double angle}) {
    final pX = center.dx + armLength * sin(angle);
    final pY = center.dy - armLength * cos(angle);
    var armEndOffset = Offset(pX, pY);

    canvas.drawLine(center, armEndOffset, paint);
  }

  void drawCenterCircle(Canvas canvas, Offset center, double raduis) {
    final centerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, raduis, centerCirclePaint);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
