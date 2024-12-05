import 'package:flutter/material.dart';
import '../model/conversion_model.dart.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  Device _selectedDevice = Device.EURO; // Default selected device
  String _convertedAmount = ""; // Converted amount displayed as a string

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  void _convertAmount() {
    final double? dollarAmount = double.tryParse(_dollarController.text);
    if (dollarAmount == null || dollarAmount <= 0) {
      setState(() {
        _convertedAmount = "Invalid input";
      });
      return;
    }

    final double converted = ConversionModel.convert(_selectedDevice, dollarAmount);
    setState(() {
      _convertedAmount = converted.toStringAsFixed(2); // Format to 2 decimals
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Amount in dollars:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dollarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text(
              "Device:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            DropdownButton<Device>(
              value: _selectedDevice,
              isExpanded: true,
              dropdownColor: Colors.orange[200],
              items: Device.values.map((Device device) {
                return DropdownMenuItem<Device>(
                  value: device,
                  child: Text(ConversionModel.deviceToString(device)),
                );
              }).toList(),
              onChanged: (Device? newDevice) {
                setState(() {
                  _selectedDevice = newDevice!;
                });
                _convertAmount();
              },
            ),
            const SizedBox(height: 30),
            const Text(
              "Amount in selected device:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount.isEmpty ? "Converted amount will appear here" : _convertedAmount,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
