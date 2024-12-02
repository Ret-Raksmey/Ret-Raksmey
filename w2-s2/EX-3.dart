class MyDuration {
  final int milliseconds; 

  MyDuration.fromHours(int hours) : milliseconds = hours * 60 * 60 * 1000 {
    if (hours < 0) {
      throw ArgumentError('Duration cannot be negative.');
    }
  }

  MyDuration.fromMinutes(int minutes) : milliseconds = minutes * 60 * 1000 {
    if (minutes < 0) {
      throw ArgumentError('Duration cannot be negative.');
    }
  }

  MyDuration.fromSeconds(int seconds) : milliseconds = seconds * 1000 {
    if (seconds < 0) {
      throw ArgumentError('Duration cannot be negative.');
    }
  }

  @override
  String toString() {
    int seconds = (milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }

  bool operator >(MyDuration other) {
    return milliseconds > other.milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration.fromMilliseconds(milliseconds + other.milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    if (milliseconds < other.milliseconds) {
      throw ArgumentError('This will throw an exception.');
    }
    return MyDuration.fromMilliseconds(milliseconds - other.milliseconds);
  }

  MyDuration.fromMilliseconds(int milliseconds) : this.milliseconds = milliseconds {
    if (milliseconds < 0) {
      throw ArgumentError('Duration cannot be negative.');
    }
  }
}

void main() {
 
  MyDuration duration1 = MyDuration.fromHours(3); 
  MyDuration duration2 = MyDuration.fromMinutes(45); 

  print(duration1 + duration2); 

  print(duration1 > duration2); 

  try {
    print(duration2 - duration1); 
  } catch (e) {
    print(e); 
  }
}

