import 'package:flutter/material.dart';

class Msccompartment extends StatefulWidget {
  const Msccompartment({super.key});

  @override
  State<Msccompartment> createState() => _MsccompartmentState();
}

class _MsccompartmentState extends State<Msccompartment> {
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
        minimumSize: const Size(148.3, 80), // Fixed size for the button
      ),
      child: const Text(
        "MSC",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 45,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
