import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/createAccPage/emailBoxCA.dart';
import 'package:flutter_application_3/widgets/createAccPage/passwordBoxCA.dart';
import 'package:flutter_application_3/widgets/createAccPage/phoneNoBoxCA.dart';
import 'package:flutter_application_3/widgets/createAccPage/signupBoxButton.dart';
import 'package:flutter_application_3/widgets/createAccPage/usernameBoxCA.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const backButton(),
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 60),
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
                    const SizedBox(
                      height: 20, // Add some height to position form below text
                    ),
                    const phoneNoBoxCA(),
                    const SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    const emailBoxCA(),
                    const SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    const usernameBoxCA(),
                    const SizedBox(
                      height: 10, // Add some height to position form below text
                    ),
                    const passwordBoxCA(),

                    const SizedBox(height: 20), // Space between form and button
                    const Center(
                      child: signupBoxButton(),
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle log in
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
            ),
          ],
        ),
      ),
    );
  }
}
