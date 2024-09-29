import 'package:flutter/material.dart';

class Compartment7 extends StatefulWidget {
  const Compartment7({super.key});

  @override
  State<Compartment7> createState() => _Compartment7State();
}

class _Compartment7State extends State<Compartment7> {
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
        "7",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
