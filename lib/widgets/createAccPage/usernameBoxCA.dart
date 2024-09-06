import 'package:flutter/material.dart';

class usernameBoxCA extends StatefulWidget {
  const usernameBoxCA({super.key});

  @override
  State<usernameBoxCA> createState() => _usernameBoxCAState();
}

class _usernameBoxCAState extends State<usernameBoxCA> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Username",
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
