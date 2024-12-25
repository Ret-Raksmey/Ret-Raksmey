import 'package:flutter/material.dart';
import 'package:projrct_flutter/Project/screen/welcome_screen.dart';


void main() {
  runApp(SlidingPuzzleApp());
}

class SlidingPuzzleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliding Puzzle',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
} 