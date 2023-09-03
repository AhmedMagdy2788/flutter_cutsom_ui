import 'dart:developer';

import 'package:flutter/material.dart';

class MyBaseTabLayout extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  const MyBaseTabLayout(
      {super.key,
      required this.child,
      this.width = 300,
      this.height = 300,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      log("${constraints.maxHeight}, ${constraints.maxWidth}");
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Center(
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.amber.shade100,
                //     blurRadius: 8,
                //     offset: const Offset(0, 1),
                //     // blurStyle: BlurStyle.outer,
                //     spreadRadius: 3,
                //   )
                // ],
              ),
              // color: color,
              width: width,
              height: height,
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
