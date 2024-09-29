import 'package:flutter/material.dart';

class Compartment6 extends StatefulWidget {
  const Compartment6({super.key});

  @override
  State<Compartment6> createState() => _Compartment6State();
}

class _Compartment6State extends State<Compartment6> {
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
        minimumSize: const Size(149, 43), // Fixed size for the button
      ),
      child: const Text(
        "6",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
