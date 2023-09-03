import 'package:flutter/material.dart';

class SliderCust extends StatefulWidget {
  const SliderCust({super.key});

  @override
  State<SliderCust> createState() => _SliderCustState();
}

class _SliderCustState extends State<SliderCust> {
  @override
  Widget build(BuildContext context) {
    Widget buildSliderHeader(double width, double height) {
      return ClipOval(
        child: Container(
          width: width,
          height: height,
          color: Colors.blue.shade900,
        ),
      );
    }

    return Expanded(
      child: LayoutBuilder(
          builder: ((context, constraints) => Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.blue,
                child: const Center(child: SliderHeader(radus: 100)),
              ))),
    );

    // Widget constraindBox = ConstrainedBox(
    //   constraints: const BoxConstraints(
    //       minWidth: 100, maxWidth: 200, minHeight: 50, maxHeight: 60),
    //   child: Container(
    //     width: 150,
    //     height: double.infinity,
    //     color: Colors.blue,
    //     child: const Center(
    //         child: Text(
    //       "Boxed Constrained widget",
    //       textAlign: TextAlign.center,
    //     )),
    //   ),
    // );
    // return true ? constraindBox : layoutbuilder;
  }
}

class SliderHeader extends StatefulWidget {
  final double radus;
  const SliderHeader({super.key, required this.radus});

  @override
  State<SliderHeader> createState() => _SliderHeaderState();
}

class _SliderHeaderState extends State<SliderHeader> {
  // A boolean variable to control the visibility of the second circle
  bool showSecondCircle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When long press starts, set showSecondCircle to true
      onTapDown: (details) {
        setState(() {
          showSecondCircle = true;
        });
      },
      // When long press ends, set showSecondCircle to false
      onTapUp: (details) {
        setState(() {
          showSecondCircle = false;
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipOval(
            child: AnimatedContainer(
                // Use duration and curve to create a smooth animation
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: showSecondCircle ? widget.radus : 0,
                height: showSecondCircle ? widget.radus : 0,
                // Use showSecondCircle to change the color of the container
                color: Colors.blue.shade300),
          ),
          ClipOval(
            child: Container(
              width: widget.radus / 2,
              height: widget.radus / 2,
              color: Colors.blue.shade900,
            ),
          )
        ],
      ),
    );
  }
}
