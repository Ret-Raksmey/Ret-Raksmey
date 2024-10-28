import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: Center(
          child: Text("Hello!, My name is Raksmey.",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 50,
              )),
        ),
      ),
    ),
  );
}
