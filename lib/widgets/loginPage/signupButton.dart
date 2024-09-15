import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/createAccount.dart';

class signupButton extends StatefulWidget {
  const signupButton({super.key});

  @override
  State<signupButton> createState() => _signupButtonState();
}

class _signupButtonState extends State<signupButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigate to SecondPage when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateAccount()),
        );
      },
      child: Text(
        'Sign-up!',
        style: TextStyle(
          fontFamily: "Inter",
          color: Color.fromRGBO(0, 0, 0, 1.000),
        ),
      ),
    );
  }
}
