import 'package:flutter/material.dart';

class ClipPathPage extends StatelessWidget {
  const ClipPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Colors.red,
          height: 400,
          child: const Center(
            child: Text(
              "Clip Path",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    // path.moveTo(w / 2, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.quadraticBezierTo(w / 2, h - 100, 0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
