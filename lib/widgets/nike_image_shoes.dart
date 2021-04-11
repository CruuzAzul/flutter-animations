import 'package:flutter/material.dart';

class NikeImageShoes extends AnimatedWidget {
  final Alignment alignment;
  final double opacity;

  // ignore: unused_element
  Animation get _animationLetters => listenable as Animation;

  const NikeImageShoes({
    Key key,
    Animation animationDown,
    this.alignment,
    this.opacity,
  }) : super(key: key, listenable: animationDown);

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
