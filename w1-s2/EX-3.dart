void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];


  // You code
  List<int> passedScores = scores.where((scores) => scores >= 50).toList();

  int passedTotals = passedScores.length;
  print(passedScores);
  print('$passedTotals students passed');
}

  
   

 
