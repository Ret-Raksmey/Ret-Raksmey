import 'package:flutter/material.dart';

class GameData {
  List<int> numbers;
  int moves;
  Stopwatch stopwatch;

  GameData({
    required this.numbers,
    required this.moves,
    required this.stopwatch,
  });
}