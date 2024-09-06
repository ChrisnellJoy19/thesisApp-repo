import 'package:flutter/material.dart';

class usernameBox extends StatefulWidget {
  const usernameBox({super.key});

  @override
  State<usernameBox> createState() => _usernameBoxState();
}

class _usernameBoxState extends State<usernameBox> {
  final _usernameController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }
}
