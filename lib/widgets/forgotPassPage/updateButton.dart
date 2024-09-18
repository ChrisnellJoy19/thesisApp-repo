import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/fP_updated.dart';

class updateButton extends StatefulWidget {
  const updateButton({super.key});

  @override
  State<updateButton> createState() => _updateButtonState();
}

class _updateButtonState extends State<updateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to SecondPage when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Updated()),
        );
      },
      child: Text(
        "Update",
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
