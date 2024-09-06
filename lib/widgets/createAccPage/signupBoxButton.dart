import 'package:flutter/material.dart';

class signupBoxButton extends StatefulWidget {
  const signupBoxButton({super.key});

  @override
  State<signupBoxButton> createState() => _signupBoxButtonState();
}

class _signupBoxButtonState extends State<signupBoxButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for sign-up button
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(100, 50), // Fixed size for the button
      ),
      child: const Text(
        "Sign-up",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 15,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
