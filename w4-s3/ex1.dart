import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Color get _textColor => _isSelected ? Colors.white : Colors.black;
  Color? get _backgroundColor => _isSelected ? Colors.blue[500] : Colors.blue[50];
  String get _text => _isSelected ? 'Selected' : 'Not Selected';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: _toggleSelection,
          style: ElevatedButton.styleFrom(
            backgroundColor: _backgroundColor,
          ),
          child: Center(
            child: Text(
              _text,
              style: TextStyle(color: _textColor),
            ),
          ),
        ),
      ),
    );
  }
}

