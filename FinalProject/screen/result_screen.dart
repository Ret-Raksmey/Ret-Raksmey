import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final int moves;
  final bool isWin;

  ResultScreen({required this.moves, required this.isWin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isWin ? Colors.blue : Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isWin ? 'Congratulations!' : 'Game Over!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              isWin ? 'You solved the puzzle!' : 'Better luck next time!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Moves: $moves',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  (route) => false,
                );
              },
              child: Text('New Game'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}