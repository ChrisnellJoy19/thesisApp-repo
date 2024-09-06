import 'package:flutter/material.dart';

class compartmentNumber extends StatefulWidget {
  const compartmentNumber({super.key});

  @override
  State<compartmentNumber> createState() => _compartmentNumberState();
}

class _compartmentNumberState extends State<compartmentNumber> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 51),
        height: 70,
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(103, 12, 13, 1.000),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "1",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
