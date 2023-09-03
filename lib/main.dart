import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/animation_page.dart';
import 'pages/clip_path_page.dart';
import 'pages/clock_paint_page.dart';
import 'pages/drawing_canvas_page.dart';
import 'pages/image_paint_page.dart';
import 'pages/star_paint_page.dart';
import 'painters/arc_painter.dart';
import 'painters/triangle_painter.dart';
import 'widgets/my_layout_tab.dart';
import 'widgets/tabbar_widget.dart';
import 'pages/line_paint_page.dart';
import 'pages/rectangle_paint_page.dart';
import 'pages/rounded_rectangle_paint_page.dart';
import 'painters/circle_painter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Custom Paint';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: const Color(0xFF2D2F41),
            brightness: Brightness.dark),
        darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: const Color(0xFF2D2F41),
            brightness: Brightness.dark),
        themeMode: ThemeMode.dark,
        home: const MainPage(),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => const TabBarWidget(
        title: MyApp.title,
        tabs: [
          Tab(icon: Icon(Icons.stacked_line_chart), text: 'Line'),
          Tab(icon: Icon(Icons.crop_landscape), text: 'Rectangle'),
          Tab(icon: Icon(Icons.crop_square), text: 'Rounded Rectangle'),
          Tab(icon: Icon(Icons.circle), text: 'Circle'),
          Tab(icon: Icon(Icons.architecture), text: 'Arc'),
          Tab(icon: Icon(Icons.warning), text: 'Triangle'),
          Tab(icon: Icon(Icons.image), text: 'Image'),
          Tab(icon: Icon(Icons.route), text: 'Clip Path'),
          Tab(icon: Icon(Icons.timer), text: 'Clock'),
          Tab(icon: Icon(Icons.draw), text: 'drawing'),
          Tab(icon: Icon(Icons.star), text: 'Star'),
          Tab(icon: Icon(Icons.rotate_right_sharp), text: 'Animi'),
        ],
        children: [
          LinePaintPage(),
          RectanglePaintPage(),
          RoundedRectanglePaintPage(),
          CirclePaintPage(),
          ArcPaintPage(),
          TrianglePaintPage(),
          ImagePaintPage(),
          ClipPathPage(),
          ClockPaintPage(),
          DrawingCanvasPage(),
          StarPaintPage(),
          AnimationPage()
        ],
      );
}

class TrianglePaintPage extends StatelessWidget {
  const TrianglePaintPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
        child: CustomPaint(foregroundPainter: TrianglePainter()));
  }
}

class ArcPaintPage extends StatelessWidget {
  const ArcPaintPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(child: CustomPaint(foregroundPainter: ArcPainter()));
  }
}

class CirclePaintPage extends StatelessWidget {
  const CirclePaintPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyBaseTabLayout(
      child: CustomPaint(
        foregroundPainter: CirclePainter(),
      ),
    );
  }
}
