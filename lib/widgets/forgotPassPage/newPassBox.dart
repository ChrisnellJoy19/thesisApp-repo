import 'package:flutter/material.dart';

class newPassBox extends StatefulWidget {
  const newPassBox({super.key});

  @override
  State<newPassBox> createState() => _newPassBoxState();
}

class _newPassBoxState extends State<newPassBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Password",
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
