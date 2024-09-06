import 'package:flutter/material.dart';

class phoneNoButton extends StatefulWidget {
  const phoneNoButton({super.key});

  @override
  State<phoneNoButton> createState() => _phoneNoButtonState();
}

class _phoneNoButtonState extends State<phoneNoButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for button 2
      },
      child: Text(
        "Phone Number",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 15,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(103, 12, 13, 1.000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(250, 100), // Fixed size for the buttons
      ),
    );
  }
}
