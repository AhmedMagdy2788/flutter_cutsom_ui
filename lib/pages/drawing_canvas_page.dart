import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_cutsom_ui/widgets/my_layout_tab.dart';

class Pair<T1, T2> {
  T1 first;
  T2 second;

  Pair(this.first, this.second);
}

class DrawingCanvasPage extends StatefulWidget {
  const DrawingCanvasPage({super.key});

  @override
  State<DrawingCanvasPage> createState() => _DrawingCanvasPageState();
}

class _DrawingCanvasPageState extends State<DrawingCanvasPage> {
  List<Offset> pathPoints = [
    const Offset(300 * 2 / 6, 300 * 0 / 6),
    const Offset(300 * 2 / 6, 300 * 6 / 6),
    const Offset(300 * 4 / 6, 300 * 0 / 6),
    const Offset(300 * 4 / 6, 300 * 6 / 6),
    const Offset(300 * 0 / 6, 300 * 2 / 6),
    const Offset(300 * 6 / 6, 300 * 2 / 6),
    const Offset(300 * 0 / 6, 300 * 4 / 6),
    const Offset(300 * 6 / 6, 300 * 4 / 6),
    // Offset(300 * 3 / 6, 300 * 0 / 6),
    // Offset(300 * 5 / 6, 300 * 1 / 6),
  ];
  // List<Pair<int, int>>
  //pairs consist of start offset point and the number of following points in PathPoints list
  List<Pair<int, int>> pairStartEndPoints = [
    Pair(0, 1),
    Pair(2, 1),
    Pair(4, 1),
    Pair(6, 1),
  ];
  // int numberOfContanusPoints = 0;

  @override
  Widget build(BuildContext context) {
    // int startPoint = pathPoints.length;
    return MyBaseTabLayout(
      width: 900,
      height: 600,
      child: GestureDetector(
        onPanDown: (details) {
          setState(() {
            log("local position: ${details.localPosition}");
            log("global position: ${details.globalPosition}");
            pathPoints.add(details.localPosition);
            pairStartEndPoints.add(Pair(pathPoints.length - 1, 0));
          });
        },
        onPanUpdate: (details) {
          setState(() {
            pathPoints.add(details.localPosition);
            pairStartEndPoints.last.second += 1;
            // numberOfContanusPoints++;
          });
        },
        onPanEnd: (details) {
          setState(() {
            // startPoint = pathPoints.length - 1;
            log("path points length: ${pathPoints.length}");
            // log("start point: $startPoint");
            // numberOfContanusPoints = 0;
          });
          // pathPoints.add(details.);
        },
        child: CustomPaint(
          painter: FlipBookPainter(pathPoints, pairStartEndPoints),
        ),
      ),
    );
  }
}

class FlipBookPainter extends CustomPainter {
  List<Offset> pathPoints;
  List<Pair<int, int>> pairStartEndPoints;
  FlipBookPainter(this.pathPoints, this.pairStartEndPoints);
  @override
  void paint(Canvas canvas, ui.Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final path = Path();
    for (var pair in pairStartEndPoints) {
      log("pair: ${pair.first}, ${pair.second}");
      path.moveTo(pathPoints[pair.first].dx, pathPoints[pair.first].dy);
      if (pair.second == 0) {
        canvas.drawPoints(ui.PointMode.points, [pathPoints[pair.first]], paint);
      }
      for (var i = pair.first; i <= pair.second + pair.first; i++) {
        path.arcToPoint(pathPoints[i], radius: Radius.zero);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(FlipBookPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FlipBookPainter oldDelegate) => false;
}
