import 'package:flutter/material.dart';
import 'package:zoom_in_parralax/screens/screens_management.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => ScreensManagement(),
      },
    );
  }
}
