import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/my_layout_tab.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _constroller;
  late Animation _animation;
  bool isFavorite = false;
  late List<Color> _colors = [];

  @override
  void initState() {
    super.initState();
    List.generate(
        9,
        (index) =>
            _colors.add(Color.fromARGB(255 ~/ (index + 1), 255, 193, 7)));
    _constroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      // lowerBound: 0,
      // upperBound: 1,
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(parent: _constroller, curve: Curves.easeInOut));
    _constroller.repeat();
  }

  @override
  void dispose() {
    _constroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                _colors = rotateList<Color>(_colors);
                // _constroller.forward();
              });
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0, end: .2).animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut)),
                child: child,
              ),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            )),
        Expanded(
          child: MyBaseTabLayout(
            color: Colors.transparent,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  // origin: Offset(150, 150),
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(_animation.value),
                  // alignment: Alignment.center,
                  child: child,
                );
                // return SlideTransition(
                //   position: Tween(begin: const Offset(0, .5), end: Offset.zero)
                //       .animate(CurvedAnimation(
                //           parent: _constroller, curve: Curves.easeOutSine)),
                //   child: child,
                // );
              },
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(15),
                child: GridView.builder(
                    // padding: EdgeInsets.all(20 - _constroller.value * 20),
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                      // crossAxisSpacing: 20,
                      // mainAxisSpacing: 20,
                      // mainAxisExtent: 20,
                    ),
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _constroller.value * 100,
                        height: _constroller.value * 100,
                        color: _colors[index],
                      );
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Type> rotateList<Type>(List<Type> list) {
    // Remove the last element of the list and store it in a variable
    var lastElement = list.removeLast();
    // Insert the removed element at the beginning of the list
    list.insert(0, lastElement);
    // Return the modified list
    return list;
  }
}
