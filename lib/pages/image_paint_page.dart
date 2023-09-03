import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../painters/image_painter.dart';
import '../widgets/my_layout_tab.dart';

class ImagePaintPage extends StatefulWidget {
  const ImagePaintPage({Key? key}) : super(key: key);

  @override
  State<ImagePaintPage> createState() => _ImagePaintPageState();
}

class _ImagePaintPageState extends State<ImagePaintPage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage('assets/images/image.jpg');
  }

  Future loadImage(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
        child: FittedBox(
      child: SizedBox(
        width: image!.width.toDouble(),
        height: image!.height.toDouble(),
        child: CustomPaint(foregroundPainter: ImagePainter(image!)),
      ),
    ));
  }
}
