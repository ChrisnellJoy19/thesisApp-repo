import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final ScrollController _scrollController = ScrollController();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 32,
                          color: Color.fromRGBO(103, 12, 13, 1.000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Username",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
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
                    const SizedBox(height: 10),
                    const Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
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
                    const SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(103, 12, 13, 1.000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text(
                          "Sign-up",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 1.000),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
