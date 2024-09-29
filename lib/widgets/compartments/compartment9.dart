import 'package:flutter/material.dart';

class Compartment9 extends StatefulWidget {
  const Compartment9({super.key});

  @override
  State<Compartment9> createState() => _Compartment9State();
}

class _Compartment9State extends State<Compartment9> {
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
        minimumSize: const Size(305, 70), // Fixed size for the button
      ),
      child: const Text(
        "9",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
