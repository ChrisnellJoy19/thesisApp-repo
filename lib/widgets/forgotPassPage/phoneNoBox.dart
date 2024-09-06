import 'package:flutter/material.dart';

class phoneNoBox extends StatefulWidget {
  const phoneNoBox({super.key});

  @override
  State<phoneNoBox> createState() => _phoneNoBoxState();
}

class _phoneNoBoxState extends State<phoneNoBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone number",
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
