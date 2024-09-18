import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/emailBox.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/fpHeader.dart';
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
      home: FPEmail(),
    );
  }
}

class FPEmail extends StatefulWidget {
  const FPEmail({super.key});

  @override
  _FPEmailState createState() => _FPEmailState();
}

class _FPEmailState extends State<FPEmail> {
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
                    emailBox(),
                    SizedBox(height: 100), // Space between form and button
                    Center(
                      child: sendVerificationButton(),
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
