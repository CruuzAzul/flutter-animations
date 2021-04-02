import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class NikeButton extends StatelessWidget {
  final String text;

  const NikeButton({Key key, this.text}) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFff8a67),
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () => {},
        child: Container(
          child: ClipRect(
            child: SizedBox(
              height: 50,
              width: 250,
              child: Stack(
                children: [
                  Center(
                      child: Text(
                    text,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(20.0)
                        ..rotateZ(vector.radians(-20)),
                      child: Image.asset(
                        'images/nike/logo-nike.png',
                        height: 30,
                        color: Color(0xFFd17052),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
