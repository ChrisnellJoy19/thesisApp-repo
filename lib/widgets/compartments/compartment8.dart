import 'package:flutter/material.dart';

class Compartment8 extends StatefulWidget {
  const Compartment8({super.key});

  @override
  State<Compartment8> createState() => _Compartment8State();
}

class _Compartment8State extends State<Compartment8> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for compartment
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(149, 70), // Fixed size for the button
      ),
      child: const Text(
        "8",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
