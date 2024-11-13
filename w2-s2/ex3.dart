class CustomDuration {
  final int _ms;//m=milli s=second h=hour min=minute
  const CustomDuration._internal(this._ms);

  factory CustomDuration.fromH(int h) {
    if (h < 0) throw Exception("Duration cannot be negative.");
    return CustomDuration._internal(h * 3600000); 
  }

  factory CustomDuration.fromMin(int min) {
    if (min < 0) throw Exception("Duration cannot be negative.");
    return CustomDuration._internal(min * 60000); 
  }

  factory CustomDuration.fromS(int s) {
    if (s < 0) throw Exception("Duration cannot be negative.");
    return CustomDuration._internal(s * 1000);
  }

  int get ms => _ms;

  int get inH => _ms ~/ 3600000;
  int get inMin => _ms ~/ 60000;
  int get inS => _ms ~/ 1000;

  @override
  String toString() {
    return "Duration: ${_ms}ms (${inH} hours, ${inMin % 60} minutes, ${inS % 60} seconds)";
  }
}

extension CustomDurationOperators on CustomDuration {
  bool operator >(CustomDuration other) {
    return this._ms > other._ms;
  }
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._internal(this._ms + other._ms);
  }
  CustomDuration operator -(CustomDuration other) {
    int result = this._ms - other._ms;
    if (result < 0) result = 0;
    return CustomDuration._internal(result);
  }
}

void main() {
  CustomDuration dur1 = CustomDuration.fromH(2); 
  CustomDuration dur2 = CustomDuration.fromMin(90); 
  CustomDuration dur3 = CustomDuration.fromS(3600); 

  print(dur1 > dur2); 
  print(dur2 > dur3); 

  CustomDuration totalDuration = dur1 + dur2;
  print(totalDuration); 
  CustomDuration diffDuration = dur1 - dur2;
  print(diffDuration); 
  CustomDuration resultDuration = dur2 - dur1;
  print(resultDuration); 
}