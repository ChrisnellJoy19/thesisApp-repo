import 'package:flutter/material.dart';

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
  void _goBack() {
    Navigator.pop(context);
  }

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
                  icon: Icon(Icons.arrow_back),
                  onPressed: _goBack,
                  color: Colors.grey, // Icon color
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          90, // Add some height to position text below arrow
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 26,
                          color: Color.fromRGBO(103, 12, 13, 1.000),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 45, // Add some height to position form below text
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              height: 8), // Space between label and form field
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
                    SizedBox(height: 100), // Space between form and button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add functionality for phone number button
                        },
                        child: Text(
                          "Send Verification Code",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 1.000),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(103, 12, 13, 1.000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize:
                              Size(250, 80), // Fixed size for the button
                        ),
                      ),
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
