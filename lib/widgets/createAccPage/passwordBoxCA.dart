import 'package:flutter/material.dart';

class passwordBoxCA extends StatefulWidget {
  const passwordBoxCA({super.key});

  @override
  State<passwordBoxCA> createState() => _passwordBoxCAState();
}

class _passwordBoxCAState extends State<passwordBoxCA> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = true;

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 1), // Space between label and form field
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            obscureText: true,
            onChanged: (value) {
              _validatePasswords();
            },
          ),
          const SizedBox(
            height: 10, // Add some height to position form below text
          ),
          const Text(
            "Confirm Password",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 1), // Space between label and form field
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: !_passwordsMatch ? 'Passwords did not match' : null,
            ),
            obscureText: true,
            onChanged: (value) {
              _validatePasswords();
            },
          ),
        ],
      ),
    );
  }
}
