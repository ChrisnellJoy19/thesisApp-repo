import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';
import 'package:flutter_application_3/pages/forgot_password/finished.dart';

class FPUpdate extends StatefulWidget {
  const FPUpdate({super.key});

  @override
  State<FPUpdate> createState() => _FPUpdateState();
}

class _FPUpdateState extends State<FPUpdate> {
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
                            "New Password",
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Confirm Password",
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
                    const SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FPFinished(),
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
                          "Update",
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
