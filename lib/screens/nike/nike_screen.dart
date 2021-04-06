import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/Animations/circle_clipper.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:zoom_in_parralax/widgets/nike_big_letter.dart';
import 'package:zoom_in_parralax/widgets/nike_menu.dart';
import 'package:zoom_in_parralax/widgets/nike_button.dart';

class SlideNike extends StatefulWidget {
  final double transitionPercentage;

  const SlideNike({
    Key key,
    this.transitionPercentage = 0,
  }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SlideNike> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationControllerBackgound;
  Animation<double> _animationShoesDown;
  Animation<double> _animationShoesTweak;
  Animation<double> _animationLetters;
  Animation<double> _animationMenu;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );
    _animationShoesDown = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.25, curve: Curves.easeInOutCubic),
    );
    _animationShoesTweak = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.25, 0.35, curve: Curves.easeInOutCubic),
    );
    _animationLetters = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.36, 0.60, curve: Curves.elasticOut),
    );
    _animationMenu = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.60, 0.75, curve: Curves.elasticOut),
    );

    animationControllerBackgound = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    animationControllerBackgound.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SlideNike oldWidget) {
    if (oldWidget.transitionPercentage == null &&
        widget.transitionPercentage != null) {
      animationController.forward(from: 0);
      animationControllerBackgound.repeat(reverse: true);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:
          InvertedCircleClipper(percentage: widget.transitionPercentage ?? 0),
      child: AnimatedBuilder(
          animation: Listenable.merge(
              [animationController, animationControllerBackgound]),
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned( // Background
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        './assets/images/nike/background.png',
                        fit: BoxFit.cover,
                      )),
                  Positioned.fill(
                      right: -180,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Opacity(
                          opacity: 0.7,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(
                                  0.0, 10 * animationControllerBackgound.value)
                              ..rotateY(vector.radians(180))
                              ..rotateZ(vector.radians(-30)),
                            child: Image.asset(
                              './assets/images/nike/nike.png',
                              fit: BoxFit.contain,
                              width: 200,
                            ),
                          ),
                        ),
                      )),
                  Positioned.fill(
                      left: 200,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Opacity(
                          opacity: 0.7,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(
                                  0.0, -20 * animationControllerBackgound.value)
                              ..rotateY(vector.radians(180))
                              ..rotateZ(vector.radians(-70)),
                            child: Image.asset(
                              './assets/images/nike/nike.png',
                              fit: BoxFit.contain,
                              width: 100,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: 30,
                      top: 30,
                      width: 100,
                      child: Image.asset(
                        './assets/images/nike/logo-nike.png',
                        fit: BoxFit.contain,
                      )),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.5,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..scale(_animationShoesDown.value)
                          ..translate(-50.0 * _animationShoesTweak.value,
                              -50 * _animationShoesTweak.value)
                          ..rotateZ(
                              vector.radians(20 * _animationShoesTweak.value)),
                        child: Image.asset(
                          './assets/images/nike/nike.png',
                          fit: BoxFit.contain,
                          width: 700,
                        ),
                      ),
                    ),
                  )),
                  Positioned.fill( // Letter A
                    left: 300,
                    child: NikeLetter(
                      letter: 'A',
                      color: Colors.white,
                      fontSize: 450,
                      alignment: Alignment.centerLeft,
                      animation: _animationLetters,
                    ),
                  ),
                  Positioned.fill( // Letter R
                    right: 300,
                    child: NikeLetter(
                      letter: 'R',
                      color: Colors.white,
                      fontSize: 450,
                      alignment: Alignment.centerRight,
                      animation: _animationLetters,
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..scale(_animationShoesDown.value)
                        ..translate(-180.0 * _animationShoesTweak.value)
                        ..rotateZ(
                            vector.radians(-35 * _animationShoesTweak.value)),
                      child: Image.asset(
                        './assets/images/nike/nike.png',
                        fit: BoxFit.contain,
                        width: 700,
                      ),
                    ),
                  )),
                  Positioned.fill( // Letter I
                    right: 100,
                    child: NikeLetter(
                      letter: 'I',
                      color: Colors.white,
                      fontSize: 450,
                      alignment: Alignment.center,
                      animation: _animationLetters,
                    ),
                  ),
                  NikeMenu(_animationMenu),
                  Positioned.fill( // Button Shop
                      bottom: 70,
                      child: Transform.translate(
                        offset: Offset(0.0, 200 * (1 - _animationMenu.value)),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: NikeButton(text: "GO TO SHOP")),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
