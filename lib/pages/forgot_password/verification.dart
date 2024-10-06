import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';
import 'package:flutter_application_3/pages/forgot_password/update.dart';

class FPVerification extends StatefulWidget {
  const FPVerification({super.key});

  @override
  State<FPVerification> createState() => _FPVerificationState();
}

class _FPVerificationState extends State<FPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 90),
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
                    const SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter Verification Code",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FPUpdate(),
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
                          "Verify",
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
      ),
    );
  }
}
