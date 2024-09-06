import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/compartments/compartment1.dart';
import 'package:flutter_application_3/widgets/compartments/compartment10.dart';
import 'package:flutter_application_3/widgets/compartments/compartment2.dart';
import 'package:flutter_application_3/widgets/compartments/compartment3.dart';
import 'package:flutter_application_3/widgets/compartments/compartment4.dart';
import 'package:flutter_application_3/widgets/compartments/compartment5.dart';
import 'package:flutter_application_3/widgets/compartments/compartment6.dart';
import 'package:flutter_application_3/widgets/compartments/compartment7.dart';
import 'package:flutter_application_3/widgets/compartments/compartment8.dart';
import 'package:flutter_application_3/widgets/compartments/compartmnet9.dart';
import 'package:flutter_application_3/widgets/compartments/mscCompartment.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/menuButton.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/wholeDrawer.dart';
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
      drawer: const wholeDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromRGBO(103, 12, 13, 1.000),
            ),
            Positioned(
              top: 1,
              right: 8,
              child: Builder(
                builder: (context) {
                  return const menuButton();
                },
              ),
            ),
            Container(
              height: 600,
              width: 400,
              margin: const EdgeInsets.only(
                  top: 90.0,
                  left: 50.0,
                  right: 50.0,
                  bottom: 50.0), // Margin to make the border visible
              padding: const EdgeInsets.only(
                  top:
                      10), // Padding to start the border below the top container
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      const Color.fromRGBO(103, 12, 13, 1.000), // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: backButton()),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "COMPARTMENT AVAILABILITY",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Color.fromRGBO(103, 12, 13, 1.000),
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "RED SECTIONS ARE OCCUPIED",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(107, 12, 13, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 15), // Space between text and buttons
                      const Align(
                        alignment: Alignment(-2, -0.5), // Adjust alignment here
                        child: Row(
                          children: [
                            Compartment1(),
                            SizedBox(width: 8.3),
                            Compartment2(),
                            SizedBox(width: 8.3),
                            Compartment3(),
                            SizedBox(width: 8.3),
                            Compartment4()
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Msccompartment(),
                          SizedBox(width: 8.3),
                          Compartment5(),
                          SizedBox(width: 8.3),
                          Compartment6(),
                        ],
                      ),
                      const SizedBox(height: 4, width: 70),
                      const Row(
                        children: [
                          Compartment7(),
                          SizedBox(width: 8.3),
                          Column(
                            children: [
                              Compartment8(),
                              Compartment9(),
                              Compartment10(),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
