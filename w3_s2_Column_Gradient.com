import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            
            Container(
              
               margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              width: 300,
              height: 100,
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color.fromARGB(255, 174, 186, 8)])),
               
              child: const Text(
                'HELLO 1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
               
            ),
            Container(
              
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color.fromARGB(255, 186, 8, 106)])),
             
              child: const Text(
                'HELLO 2',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            
            ),
            Container(
               margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color.fromARGB(255, 8, 186, 8)])),
              child: const Text(
                'HELLO 3',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
