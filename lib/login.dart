import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Username: ${_usernameController.text}, Password: ${_passwordController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height:
                        50), // Add some height to center the content vertically
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/login_icon.png'),
                ),
                SizedBox(height: 16),
                Text(
                  "HELLO",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 50,
                    color: Color.fromRGBO(103, 12, 13, 1.000),
                  ),
                ),
                SizedBox(height: 32), // Add space between text and form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
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
                      ),
                      SizedBox(height: 16),
                      TextFormField(
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
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 1.000),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(103, 12, 13, 1.000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height:
                        50), // Add some height to center the content vertically
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle Sign Up
                      },
                      child: Text(
                        'Sign-up!',
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color.fromRGBO(0, 0, 0, 1.000),
                        ),
                      ),
                    ),
                    SizedBox(height: 0),
                    TextButton(
                      onPressed: () {
                        // Handle Forgot Password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color.fromRGBO(0, 0, 0, 1.000),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
