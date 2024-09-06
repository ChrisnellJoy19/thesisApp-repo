import 'package:flutter/material.dart';

class phoneNoBoxCA extends StatefulWidget {
  const phoneNoBoxCA({super.key});

  @override
  State<phoneNoBoxCA> createState() => _phoneNoBoxCAState();
}

class _phoneNoBoxCAState extends State<phoneNoBoxCA> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phone Number",
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
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
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
