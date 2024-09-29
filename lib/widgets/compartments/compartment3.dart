import 'package:flutter/material.dart';

class Compartment3 extends StatefulWidget {
  const Compartment3({super.key});

  @override
  State<Compartment3> createState() => _Compartment3State();
}

class _Compartment3State extends State<Compartment3> {
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
        "3",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
