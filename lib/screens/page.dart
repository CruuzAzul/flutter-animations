
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:zoom_in_parralax/Animations/circle_clipper.dart';

// class SlidePage extends StatefulWidget {
//   final Color color;
//   final String text;
//   final String imagePath;
//   final double transitionPercentage;

//   const SlidePage({
//     this.text,
//     this.imagePath,
//     Key key,
//     this.color,
//     this.transitionPercentage,
//   }) : super(key: key);

//   @override
//   _PageState createState() => _PageState();
// }

// class _PageState extends State<SlidePage> with SingleTickerProviderStateMixin {
//   AnimationController animationController;

//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       duration: Duration(milliseconds: 2000),
//       vsync: this,
//       upperBound: 0.05,
//     );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   void didUpdateWidget(covariant SlidePage oldWidget) {
//     if (oldWidget.transitionPercentage == null &&
//         widget.transitionPercentage != null) {
//       print("ON START");
//       animationController.forward(from: 0);
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper:
//           InvertedCircleClipper(percentage: widget.transitionPercentage ?? 0),
//       child: AnimatedBuilder(
//         animation: animationController,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: 1 +
//                 animationController.value +
//                 (animationController.value ?? 0),
//             child: child,
//           );
//         },
//         child: Container(
//           color: widget.color,
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(widget.transitionPercentage.toString()),
//                   Text(widget.text),
//                   // Image.asset(
//                   //   widget.imagePath,
//                   //   height: MediaQuery.of(context).size.height / 2,
//                   //   width: MediaQuery.of(context).size.height / 2,
//                   //   fit: BoxFit.cover,
//                   // )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }