import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/fpHeader.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/phoneNoBox.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/sendVerificationButton.dart';
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
      home: FPPhoneNumber(),
    );
  }
}

class FPPhoneNumber extends StatefulWidget {
  const FPPhoneNumber({super.key});

  @override
  _FPPhoneNumberState createState() => _FPPhoneNumberState();
}

class _FPPhoneNumberState extends State<FPPhoneNumber> {
  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          90, // Add some height to position text below arrow
                    ),
                    fpHeader(),
                    SizedBox(
                      height: 45, // Add some height to position form below text
                    ),
                    phoneNoBox(),
                    SizedBox(height: 100), // Space between form and button
                    Center(
                      child: sendVerificationButton(),
                    ),
                    SizedBox(
                      height: 32, // Space between buttons and text buttons
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
