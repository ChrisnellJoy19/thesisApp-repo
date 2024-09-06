import 'package:flutter/material.dart';

class Compartment2 extends StatefulWidget {
  const Compartment2({super.key});

  @override
  State<Compartment2> createState() => _Compartment2State();
}

class _Compartment2State extends State<Compartment2> {
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
        minimumSize: const Size(70, 40), // Fixed size for the button
      ),
      child: const Text(
        "2",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
