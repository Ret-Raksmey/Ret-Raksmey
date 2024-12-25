class GameModel {
  List<int> numbers = List<int>.generate(16, (index) => index);

  void shuffleNumbers() {
    numbers.shuffle();
  }

  bool isSorted() {
    for (int i = 0; i < numbers.length - 1; i++) {
      if (numbers[i] > numbers[i + 1]) return false;
    }
    return numbers.last == 0; 
  }
  
  bool isSolved() {
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] != (i == 15 ? 0 : i + 1)) { 
      return false; 
    }
  }
  return true;
}
}
