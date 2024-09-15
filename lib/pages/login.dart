import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/loginPage/forgotPassButton.dart';
import 'package:flutter_application_3/widgets/loginPage/loginButton.dart';
import 'package:flutter_application_3/widgets/loginPage/signupButton.dart';
import 'package:flutter_application_3/widgets/loginPage/usernameBox.dart';
import 'package:flutter_application_3/widgets/loginPage/passwordBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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
                  width: 150,
                  height: 200,
                  child: Image.asset('assets/images/login_icon.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  "HELLO",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 50,
                    color: Color.fromRGBO(103, 12, 13, 1.000),
                  ),
                ),
                const SizedBox(height: 32), // Add space between text and form
                Form(
                  key: _formKey,
                  child: const Column(
                    children: [
                      usernameBox(),
                      SizedBox(height: 16),
                      passwordBox(),
                      SizedBox(height: 16),
                      loginButton(),
                      SizedBox(height: 50),
                      signupButton(),
                      forgotPassButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
