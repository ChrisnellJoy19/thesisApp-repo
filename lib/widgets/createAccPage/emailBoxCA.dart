import 'package:flutter/material.dart';

class emailBoxCA extends StatefulWidget {
  const emailBoxCA({super.key});

  @override
  State<emailBoxCA> createState() => _emailBoxCAState();
}

class _emailBoxCAState extends State<emailBoxCA> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email Address",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 1), // Space between label and form field
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
