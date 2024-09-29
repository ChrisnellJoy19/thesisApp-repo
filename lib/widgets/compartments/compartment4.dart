import 'package:flutter/material.dart';

class Compartment4 extends StatefulWidget {
  const Compartment4({super.key});

  @override
  State<Compartment4> createState() => _Compartment4State();
}

class _Compartment4State extends State<Compartment4> {
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
        minimumSize: const Size(71, 80), // Fixed size for the button
      ),
      child: const Text(
        "4",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
