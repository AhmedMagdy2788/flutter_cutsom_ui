import 'package:flutter/material.dart';
import 'package:flutter_cutsom_ui/painters/line_painter.dart';
import 'package:flutter_cutsom_ui/widgets/my_layout_tab.dart';

class LinePaintPage extends StatelessWidget {
  const LinePaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
        child: CustomPaint(
      foregroundPainter: LinePainter(),
    ));
  }
}
