import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(25),
      color: const Color.fromARGB(255, 116, 104, 104),
      child: const Column(
        children: [
          CustomCard(text: "OOP", color: Color.fromARGB(255, 132, 141, 165)),
          CustomCard(text: "DART", color: Color.fromARGB(255, 38, 49, 80)),
          CustomCard(text: "FLUTTER", color: Color.fromARGB(255, 33, 74, 189)),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 101, 164, 216),
  });

  @override
 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
       child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
