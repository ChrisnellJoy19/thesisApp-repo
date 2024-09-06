import 'package:flutter/material.dart';

class confirmPassBox extends StatefulWidget {
  const confirmPassBox({super.key});

  @override
  State<confirmPassBox> createState() => _confirmPassBoxState();
}

class _confirmPassBoxState extends State<confirmPassBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Confirm Password",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8), // Space between label and form field
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
