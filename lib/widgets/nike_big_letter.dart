import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NikeLetter extends AnimatedWidget {
  final String letter;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  Animation get _animationLetters => listenable as Animation;

  const NikeLetter(
      {Key key,
      this.letter,
      this.fontSize,
      this.color,
      this.alignment,
      Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: alignment,
        child: Transform.translate(
          offset: Offset(0.0, -600 * (1 - _animationLetters.value)),
          child: Text(
            letter,
            style: GoogleFonts.nosifer(
              textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
