import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/screens/nike/nike_screen.dart';
import 'package:zoom_in_parralax/screens/other/title_screen.dart';
import 'package:zoom_in_parralax/screens/egypt/slideEgypt.dart';

class ScreensManagement extends StatefulWidget {
  ScreensManagement({Key key}) : super(key: key);

  @override
  _ScreensManagementState createState() => _ScreensManagementState();
}

class _ScreensManagementState extends State<ScreensManagement> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  double get pageOffset => pageController.hasClients ? pageController.page : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlideNike(
            transitionPercentage: pageOffset < 1.1 ? null : 0,
          ),
          SlideEgypt(
            transitionPercentage:
                pageOffset < 0.1 ? null : (pageOffset - 1).clamp(0.0, 1.0),
          ),
          TitleSlide(
            color: Colors.white,
            text: 'Scroll to start ...',
            transitionPercentage:
                pageController.hasClients ? pageOffset.clamp(0.0, 1.0) : null,
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
                Container(width: double.infinity),
                Container(width: double.infinity),
                Container(width: double.infinity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
