import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_in_parralax/Animations/circle_clipper.dart';

class SlideEgypt extends StatefulWidget {
  final double transitionPercentage;

  const SlideEgypt({
    Key key,
    this.transitionPercentage = 0,
  }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SlideEgypt> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SlideEgypt oldWidget) {
    if (oldWidget.transitionPercentage == null &&
        widget.transitionPercentage != null) {
      animationController.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:
          InvertedCircleClipper(percentage: widget.transitionPercentage ?? 0),
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        './assets/images/egypt/sky.png',
                        fit: BoxFit.cover,
                      )),
                  Positioned.fill(
                    top: 40,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          (-100 * ((1 - animationController.value))) +
                              (-100 * (widget.transitionPercentage ?? 0))),
                      child: Opacity(
                        opacity: animationController.value -
                            (widget.transitionPercentage ?? 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0, right: 40.0, top: 40.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'THE ANCIENT WORLD',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ibmPlexSerif(
                                    textStyle: TextStyle(
                                      color: Color(0XFFd8b189),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width / 2.2,
                              endIndent:
                                  MediaQuery.of(context).size.width / 2.2,
                              color: Color(0XFFd8b189),
                              thickness: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      left: MediaQuery.of(context).size.width / 3,
                      bottom: 0,
                      child: Transform.translate(
                          offset: Offset(
                              0.0,
                              (80 * ((1 - animationController.value))) +
                                  (80 * (widget.transitionPercentage ?? 0))),
                          child: Image.asset(
                            './assets/images/egypt/pyramid.png',
                            fit: BoxFit.contain,
                          ))),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          (200 * ((1 - animationController.value))) +
                              (200 * (widget.transitionPercentage ?? 0))),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'EGYPT',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSerif(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 300.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      right: MediaQuery.of(context).size.width / 3,
                      bottom: 0,
                      child: Transform.translate(
                          offset: Offset(
                              0.0,
                              (70 * ((1 - animationController.value))) +
                                  (70 * (widget.transitionPercentage ?? 0))),
                          child: Image.asset(
                            './assets/images/egypt/pyramid.png',
                            fit: BoxFit.contain,
                          ))),
                  Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            (100 * ((1 - animationController.value))) +
                                (100 * (widget.transitionPercentage ?? 0))),
                        child: Image.asset(
                          './assets/images/egypt/sand.png',
                          fit: BoxFit.contain,
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
