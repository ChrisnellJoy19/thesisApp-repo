import 'package:flutter/material.dart';

class PowerToggle extends StatefulWidget {
  const PowerToggle({super.key});

  @override
  State<PowerToggle> createState() => _PowerToggleState();
}

class _PowerToggleState extends State<PowerToggle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'OFF',
          style: TextStyle(
            fontFamily: "Inter",
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10), // Space between text and switch
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeColor: const Color.fromRGBO(103, 12, 13, 1.000),
        ),
        const SizedBox(width: 10), // Space between switch and text
        const Text(
          'ON',
          style: TextStyle(
            fontFamily: "Inter",
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
