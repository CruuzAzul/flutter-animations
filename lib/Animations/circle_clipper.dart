import 'dart:math' as math;
import 'package:flutter/material.dart';

class InvertedCircleClipper extends CustomClipper<Path> {
  final double percentage;

  InvertedCircleClipper({this.percentage});

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: math.sqrt(size.longestSide * size.longestSide +
                  size.shortestSide * size.shortestSide) *
              percentage *
              0.5,
        ),
      )
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
