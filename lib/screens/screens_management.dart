import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/screens/page.dart';
import 'package:zoom_in_parralax/screens/slide.dart';

class ScreensManagement extends StatefulWidget {
  ScreensManagement({Key key}) : super(key: key);

  @override
  _ScreensManagementState createState() => _ScreensManagementState();
}

class _ScreensManagementState extends State<ScreensManagement>
    with TickerProviderStateMixin {
  PageController pageController;
  AnimationController _animationController;
  Animation<double> _animationTest;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationTest = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 1.0),
    );

    super.initState();
    pageController = PageController();
    print(pageController);
    pageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  double get pageOffset => pageController.hasClients ? pageController.page : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, _) {
          return Scaffold(
            body: Stack(
              children: [
                SlidePage(
                  color: Colors.yellow,
                  text: 'The master fisherman',
                  imagePath: 'images/image2.jpg',
                  transitionPercentage: pageOffset < 1.1 ? null : 0,
                  animation: _animationTest,
                ),
                SlidePage(
                  color: Colors.deepOrange,
                  text: 'What the deer are telling us',
                  imagePath: 'images/image1.jpg',
                  transitionPercentage: pageOffset < 0.1
                      ? null
                      : (pageOffset - 1).clamp(0.0, 1.0),
                  animation: _animationTest,
                ),
                SlidePage(
                  color: Colors.orangeAccent,
                  text: 'The elephant queen',
                  imagePath: 'images/image0.jpg',
                  transitionPercentage: pageController.hasClients
                      ? pageOffset.clamp(0.0, 1.0)
                      : null,
                  animation: _animationTest,
                ),
                NotificationListener<ScrollNotification>(
                  onNotification: (not) {
                    // print(not);
                    return true;
                  },
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      Opacity(
                        opacity: 1 - _animationTest.value,
                        child: Container(
                            width: double.infinity,
                            child: TextButton(
                              child: Text('Click to ZoomIn'),
                              onPressed: () {
                                print("Click");
                                print(_animationController.value);
                                _animationController.forward(from: 0.0);
                              },
                            )),
                      ),
                      Container(
                          width: double.infinity,
                          child: TextButton(
                            child: Text('Click to ZoomIn1'),
                            onPressed: () {
                              print("Click1");
                            },
                          )),
                      Container(
                          width: double.infinity,
                          child: TextButton(
                            child: Text('Click to ZoomIn2'),
                            onPressed: () {
                              print("Click2");
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
