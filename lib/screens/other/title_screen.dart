import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/Animations/circle_clipper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TitleSlide extends StatefulWidget {
  final Color color;
  final String text;
  final String imagePath;
  final double transitionPercentage;

  const TitleSlide({
    this.text,
    this.imagePath,
    Key key,
    this.color,
    this.transitionPercentage,
  }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TitleSlide> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> _animationScall;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animationScall = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TitleSlide oldWidget) {
    if (oldWidget.transitionPercentage == null &&
        widget.transitionPercentage != null) {
      animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:
          InvertedCircleClipper(percentage: widget.transitionPercentage ?? 0.0),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (widget.transitionPercentage ?? 0.0),
            child: child,
          );
        },
        child: Stack(children: [
          Container(
              color: widget.color,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      widget.text,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF065c99)),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 00),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              )),
          Positioned(
            top: 30.0,
            left: 30.0,
            child: ScaleTransition(
              scale: _animationScall,
              child: FlutterLogo(size: 50.0),
            ),
          ),
        ]),
      ),
    );
  }
}
