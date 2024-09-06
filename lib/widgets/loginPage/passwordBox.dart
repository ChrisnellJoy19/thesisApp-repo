import 'package:flutter/material.dart';

class passwordBox extends StatefulWidget {
  const passwordBox({super.key});

  @override
  State<passwordBox> createState() => _passwordBoxState();
}

class _passwordBoxState extends State<passwordBox> {
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
