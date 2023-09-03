import 'package:flutter/material.dart';

import '../widgets/sliders/simi_circle_slider.dart';
import '../widgets/sliders/slider.dart';

class MyCustomLayout extends StatelessWidget {
  const MyCustomLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use LayoutBuilder to get the parent widget's constraints
        return SingleChildScrollView(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Parent widget size: ${constraints.maxWidth} x ${constraints.maxHeight}'),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    // Use ConstrainedBox to impose additional constraints on the child widget
                    minWidth: 100,
                    maxWidth: 200,
                    minHeight: 50,
                    maxHeight: 100,
                  ),
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Child widget')),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SimiCiricleSliderWidget(),
                const SizedBox(
                  height: 20,
                ),
                const SliderCust(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SimiCiricleSliderWidget extends StatefulWidget {
  const SimiCiricleSliderWidget({super.key});

  @override
  State<SimiCiricleSliderWidget> createState() =>
      _SimiCiricleSliderWidgetState();
}

class _SimiCiricleSliderWidgetState extends State<SimiCiricleSliderWidget> {
  int value = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SemiCircleSlider(
            initialValue: value,
            divisions: 11,
            onChanged: (i) {
              setState(() {
                value = i;
              });
            },
            image: const NetworkImage(
              'https://docs.flutter.dev/assets/images/dash/Dash.png',
            ),
          ),
          Text('Value: $value'),
        ],
      ),
    );
  }
}
