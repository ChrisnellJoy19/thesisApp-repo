import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/emailButton.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/fpHeader.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/phoneNoButton.dart';
import 'package:flutter_application_3/widgets/loginPage/backButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ForgotPassword(),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: backButton(),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                      height:
                          90), // Add some height to position text below arrow
                  fpHeader(),

                  SizedBox(height: 10),
                  Padding(
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
                  SizedBox(
                      height:
                          50), // Add some height to position buttons below text
                  emailButton(),
                  SizedBox(height: 16), // Space between buttons
                  phoneNoButton(),
                  SizedBox(
                      height: 32), // Space between buttons and text buttons
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
