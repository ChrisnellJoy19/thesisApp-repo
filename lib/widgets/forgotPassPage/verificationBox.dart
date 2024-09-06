import 'package:flutter/material.dart';

class verificationBox extends StatefulWidget {
  const verificationBox({super.key});

  @override
  State<verificationBox> createState() => _verificationBoxState();
}

class _verificationBoxState extends State<verificationBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Verification Code",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8), // Space between label and form field
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
