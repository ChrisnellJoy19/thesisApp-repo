import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/fpHeader.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/verificationBox.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/verifyButton.dart';
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
      home: FPVerification(),
    );
  }
}

class FPVerification extends StatefulWidget {
  const FPVerification({super.key});

  @override
  _FPVerificationState createState() => _FPVerificationState();
}

class _FPVerificationState extends State<FPVerification> {
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
                    SizedBox(height: 90),

                    fpHeader(),

                    SizedBox(height: 45),

                    verificationBox(),

                    SizedBox(height: 100), // Space between form and button
                    Center(
                      child: verifyButton(),
                    ),
                    SizedBox(height: 32),
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
