import 'package:flutter/material.dart';

class signupButton extends StatefulWidget {
  const signupButton({super.key});

  @override
  State<signupButton> createState() => _signupButtonState();
}

class _signupButtonState extends State<signupButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
