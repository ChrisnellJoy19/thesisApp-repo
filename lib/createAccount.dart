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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _passwordsMatch = true;

  void _goBack() {
    Navigator.pop(context);
  }

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _goBack,
                color: Colors.grey, // Icon color
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          60, // Add some height to position text below arrow
                    ),
                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 32,
                          color: Color.fromRGBO(103, 12, 13, 1.000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20, // Add some height to position form below text
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1), // Space between label and form field
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    Text(
                      "Email Address",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1), // Space between label and form field
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    Text(
                      "Username",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1), // Space between label and form field
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1), // Space between label and form field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        _validatePasswords();
                      },
                    ),
                    SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1), // Space between label and form field
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText:
                            !_passwordsMatch ? 'Passwords did not match' : null,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        _validatePasswords();
                      },
                    ),
                    SizedBox(height: 20), // Space between form and button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add functionality for sign-up button
                        },
                        child: Text(
                          "Sign-up",
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
                          minimumSize:
                              Size(100, 50), // Fixed size for the button
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle log in
                            },
                            child: Text(
                              'Already have an account? Log in!',
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color.fromRGBO(198, 22, 22, 100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Space at the bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
