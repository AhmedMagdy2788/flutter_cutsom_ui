import 'package:flutter/material.dart';

import '../widgets/my_layout_tab.dart';
import '../painters/rounded_rectangle_painter.dart';

class RoundedRectanglePaintPage extends StatelessWidget {
  const RoundedRectanglePaintPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
        child: CustomPaint(
      foregroundPainter: RoundedRectanglePainter(),
    ));
  }
}
