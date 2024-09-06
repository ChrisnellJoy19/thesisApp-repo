import 'package:flutter/material.dart';

class Compartment10 extends StatefulWidget {
  const Compartment10({super.key});

  @override
  State<Compartment10> createState() => _Compartment10State();
}

class _Compartment10State extends State<Compartment10> {
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
        minimumSize: const Size(148.3, 62.5), // Fixed size for the button
      ),
      child: const Text(
        "10",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
