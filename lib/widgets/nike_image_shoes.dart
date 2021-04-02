
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NikeImageShoes extends AnimatedWidget {
  final Alignment alignment;
  final double opacity;

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
