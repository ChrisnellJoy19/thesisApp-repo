import 'package:flutter/material.dart';

class emailButton extends StatefulWidget {
  const emailButton({super.key});

  @override
  State<emailButton> createState() => _emailButtonState();
}

class _emailButtonState extends State<emailButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for button 1
      },
      child: const Text(
        "Email",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 15,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(250, 100), // Fixed size for the buttons
      ),
    );
  }
}
