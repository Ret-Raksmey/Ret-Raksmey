import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color List',
      home: ColorListPage(),
    );
  }
}

class ColorListPage extends StatelessWidget {
  final List<String> colors = ["red", "blue", "green"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Method 1: Loop in Array', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 8),
            _buildColorListWithLoop(),
            SizedBox(height: 16),
            Text('Method 2: Map', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 8),
            _buildColorListWithMap(),
            SizedBox(height: 16),
            Text('Method 3: Dedicated Function', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 8),
            _buildColorListWithDedicatedFunction(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorListWithLoop() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Text(
          colors[index],
          style: TextStyle(
            color: Colors.primaries[index],
            fontSize: 24,
          ),
        );
      },
    );
  }

  Widget _buildColorListWithMap() {
    return ListView(
      shrinkWrap: true,
      children: colors.map((color) {
        return Text(
          color,
          style: TextStyle(
            color: Colors.primaries[colors.indexOf(color)],
            fontSize: 24,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorListWithDedicatedFunction() {
    return ListView(
      shrinkWrap: true,
      children: getColorWidgets(),
    );
  }

  List<Widget> getColorWidgets() {
    return colors.map((color) {
      return Text(
        color,
        style: TextStyle(
          color: Colors.primaries[colors.indexOf(color)],
          fontSize: 24,
        ),
      );
    }).toList();
  }
}
