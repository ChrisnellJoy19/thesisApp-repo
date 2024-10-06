import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';

class FPFinished extends StatefulWidget {
  const FPFinished({super.key});

  @override
  State<FPFinished> createState() => _FPFinishedState();
}

class _FPFinishedState extends State<FPFinished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 90),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "PASSWORD UPDATED!",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 26,
                        color: Color.fromRGBO(103, 12, 13, 1.000),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                    height: 250,
                    child: Image(
                      image: AssetImage('assets/images/Lock.png'),
                    ),
                  ),
                  const SizedBox(height: 55),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(103, 12, 13, 1.000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(250, 80),
                      ),
                      child: const Text(
                        "Proceed to Log in",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 15,
                          color: Color.fromRGBO(255, 255, 255, 1.000),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
