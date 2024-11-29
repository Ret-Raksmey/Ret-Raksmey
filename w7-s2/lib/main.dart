//lib/main.dart
import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'quiz_app.dart';

void main() {
  final quiz = Quiz(
    title: 'Crazy Quiz',
    questions: [
      Question(
        title: 'Who is the best teacher?',
        possibleAnswers: ['Ronan', 'Hengly', 'Leangsiv'],
        goodAnswer: 'Ronan',
      ),
      Question(
        title: 'What is the best color?',
        possibleAnswers: ['Red', 'Blue', 'Green'],
        goodAnswer: 'Green',
      ),
      Question(
        title: 'What is 2 + 2?',
        possibleAnswers: ['3', '4', '5', '6'],
        goodAnswer: '4',
      ),
    ],
  );

  runApp(QuizApp(quiz));
}
