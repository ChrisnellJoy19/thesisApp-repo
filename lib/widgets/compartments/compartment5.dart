import 'package:flutter/material.dart';

class Compartment5 extends StatefulWidget {
  const Compartment5({super.key});

  @override
  State<Compartment5> createState() => _Compartment5State();
}

class _Compartment5State extends State<Compartment5> {
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
        "5",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
