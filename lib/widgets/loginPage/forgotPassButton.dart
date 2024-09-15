import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/forgotPassword.dart';

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
        // Navigate to SecondPage when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPassword()),
        );
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
