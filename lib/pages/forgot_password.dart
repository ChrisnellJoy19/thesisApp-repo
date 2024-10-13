import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';
import 'package:flutter_application_3/pages/forgot_password/email.dart';
import 'package:flutter_application_3/pages/forgot_password/phone.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
            Column(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 26,
                      color: Color.fromRGBO(103, 12, 13, 1.000),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Select contact details that will be used to reset your password.",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FPEmail()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize:
                        const Size(250, 100), // Fixed size for the buttons
                  ),
                  child: const Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 15,
                      color: Color.fromRGBO(255, 255, 255, 1.000),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
