import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/confirmPassBox.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/fpHeader.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/newPassBox.dart';
import 'package:flutter_application_3/widgets/forgotPassPage/updateButton.dart';
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
      home: FPUpdate(),
    );
  }
}

class FPUpdate extends StatefulWidget {
  const FPUpdate({super.key});

  @override
  _FPUpdateState createState() => _FPUpdateState();
}

class _FPUpdateState extends State<FPUpdate> {
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

                    newPassBox(),

                    SizedBox(height: 20),

                    confirmPassBox(),

                    SizedBox(height: 50), // Space between form and button
                    Center(
                      child: updateButton(),
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
