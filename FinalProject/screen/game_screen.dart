import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../model/game_model.dart';
import '../model/game_data.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameModel _gameModel;
  late GameData _gameData;

  @override
  void initState() {
    super.initState();
    _gameModel = GameModel();
    _gameModel.shuffleNumbers();
    _gameData = GameData(
      numbers: List.from(_gameModel.numbers),
      moves: 0,
      stopwatch: Stopwatch(),
    );
  }

  void resetGame() {
    setState(() {
      _gameModel.shuffleNumbers();
      _gameData = GameData(
        numbers: List.from(_gameModel.numbers),
        moves: 0,
        stopwatch: Stopwatch(),
      );
    });
  }

  bool canMoveTile(int index) {
    int emptyIndex = _gameData.numbers.indexOf(0);
    return (index - 1 == emptyIndex && index % 4 != 0) ||
        (index + 1 == emptyIndex && emptyIndex % 4 != 0) ||
        (index - 4 == emptyIndex) ||
        (index + 4 == emptyIndex);
  }

  void onTileTap(int index) {
    if (!canMoveTile(index)) return;

    setState(() {
      if (!_gameData.stopwatch.isRunning) {
        _gameData.stopwatch.start();
      }
      int emptyIndex = _gameData.numbers.indexOf(0);
      _gameData.numbers[emptyIndex] = _gameData.numbers[index];
      _gameData.numbers[index] = 0;
      _gameData.moves++;
    });

    if (_gameModel.isSolved()) {
      _gameData.stopwatch.stop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            moves: _gameData.moves,
            isWin: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Puzzle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _gameData.numbers.length,
              itemBuilder: (context, index) {
                final tileColor = _gameData.numbers[index] == 0
                    ? Colors.white
                    : Colors.blue;
                final isMovable = canMoveTile(index);

                return GestureDetector(
                  onTap: isMovable ? () => onTileTap(index) : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        _gameData.numbers[index] != 0 ? '${_gameData.numbers[index]}' : '',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: resetGame,
                  child: Text('Reset'),
                ),
                Text(
                  'Moves: ${_gameData.moves}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  'Time: ${_gameData.stopwatch.elapsed.inSeconds}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}