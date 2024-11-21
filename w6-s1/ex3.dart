import 'package:flutter/material.dart';
//import 'package:w6-s2/ex1.dart';
class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart; // Callback to handle button press

  const WelcomeScreen({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thermostat, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onStart, // Trigger the callback
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.green, backgroundColor: Colors.white,
            ),
            child: const Text('Start to convert'),
          ),
        ],
      ),
    );
  }
}

class TemperatureScreen extends StatelessWidget {
  final VoidCallback onBack; // Callback to handle navigation back

  const TemperatureScreen({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    double convertToCelsius(String fahrenheit) {
      final double fahrenheitValue = double.tryParse(fahrenheit) ?? 0.0;
      return (fahrenheitValue - 32) * 5 / 9;
    }

    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thermostat, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          const Text(
            'Converter',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Temperature in Fahrenheit',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final result =
                  convertToCelsius(controller.text).toStringAsFixed(2);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Result'),
                  content: Text('$result °C'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal, backgroundColor: Colors.white,
            ),
            child: const Text('Convert'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onBack, // Trigger the callback to go back
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal, backgroundColor: Colors.white,
            ),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TemperatureApp(),
    );
  }
}

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({Key? key}) : super(key: key);

  @override
  _TemperatureAppState createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool showConverter = false; // Track which screen to show

  void switchScreen() {
    setState(() {
      showConverter = !showConverter; // Toggle between screens
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showConverter
          ? TemperatureScreen(onBack: switchScreen)
          : WelcomeScreen(onStart: switchScreen),
    );
  }
}