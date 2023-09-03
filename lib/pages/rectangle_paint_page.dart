import 'package:flutter/material.dart';
import '../widgets/my_layout_tab.dart';
import '../painters/rectangle_painter.dart';

class RectanglePaintPage extends StatelessWidget {
  const RectanglePaintPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
      child: CustomPaint(
        foregroundPainter: RectanglePainter(),
        child: const Text(
          "Custom Paint Rectangle",
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
