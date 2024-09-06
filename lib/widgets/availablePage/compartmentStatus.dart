import 'package:flutter/material.dart';

class Compartmentstatus extends StatefulWidget {
  const Compartmentstatus({super.key});

  @override
  State<Compartmentstatus> createState() => _CompartmentstatusState();
}

class _CompartmentstatusState extends State<Compartmentstatus> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:
                const Color.fromRGBO(103, 12, 13, 1.000), // New outline color
            width: 3.0, // Border width
          ),
        ),
        child: const Text(
          "AVAILABLE",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 34,
            color: Color.fromRGBO(103, 12, 13, 1.000),
          ),
        ),
      ),
    );
  }
}
