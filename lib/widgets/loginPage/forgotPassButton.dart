import 'package:flutter/material.dart';

class forgotPassButton extends StatefulWidget {
  const forgotPassButton({super.key});

  @override
  State<forgotPassButton> createState() => _forgotPassButtonState();
}

class _forgotPassButtonState extends State<forgotPassButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle Forgot Password
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontFamily: "Inter",
          color: Color.fromRGBO(0, 0, 0, 1.000),
        ),
      ),
    );
  }
}
