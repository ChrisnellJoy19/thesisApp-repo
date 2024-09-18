import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';

class proceedLoginButton extends StatefulWidget {
  const proceedLoginButton({super.key});

  @override
  State<proceedLoginButton> createState() => _proceedLoginButtonState();
}

class _proceedLoginButtonState extends State<proceedLoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to SecondPage when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: Text(
        "Proceed to Log in",
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
        minimumSize: Size(250, 80), // Fixed size for the button
      ),
    );
  }
}
