import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/Animations/circle_clipper.dart';

class SlidePage extends AnimatedWidget {
  final Color color;
  final String text;
  final String imagePath;
  final double transitionPercentage;

  const SlidePage({
    this.text,
    this.imagePath,
    Key key,
    this.color,
    this.transitionPercentage,
    Animation animation, 
  }) : super(key: key, listenable: animation);

  Animation get _animationTest => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:
          InvertedCircleClipper(percentage: _animationTest.value ?? 0),
      child: AnimatedBuilder(
        animation: _animationTest,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 +
                _animationTest.value +
                (_animationTest.value ?? 0),
            child: child,
          );
        },
        child: Container(
          color: color,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(transitionPercentage.toString()),
                  Text(text),
                  // Image.asset(
                  //   widget.imagePath,
                  //   height: MediaQuery.of(context).size.height / 2,
                  //   width: MediaQuery.of(context).size.height / 2,
                  //   fit: BoxFit.cover,
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
