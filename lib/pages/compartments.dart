import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/drawer_button.dart';
import 'package:flutter_application_3/widgets/locker_card.dart';

class Compartments extends StatefulWidget {
  const Compartments({super.key});

  @override
  State<Compartments> createState() => _CompartmentsState();
}

class _CompartmentsState extends State<Compartments> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromRGBO(103, 12, 13, 1.000),
            ),
            const AppDrawerButton(),
            Container(
              height: 600,
              width: 400,
              margin: const EdgeInsets.only(
                top: 90.0,
                left: 50.0,
                right: 50.0,
                bottom: 50.0,
              ),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(103, 12, 13, 1.000),
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment(-2, -0.5),
                        child: Row(
                          children: [
                            LockerCard(
                              width: 149,
                              height: 70,
                              text: "1",
                              status: "unavailable",
                            ),
                            SizedBox(width: 7),
                            LockerCard(
                              width: 149,
                              height: 70,
                              text: "2",
                              status: "available",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4, width: 7),
                      const Row(
                        children: [
                          LockerCard(
                            width: 71,
                            height: 80,
                            text: "3",
                            status: "unavailable",
                          ),
                          SizedBox(width: 7),
                          LockerCard(
                            width: 71,
                            height: 80,
                            text: "4",
                            status: "maintenance",
                          ),
                          SizedBox(width: 7),
                          LockerCard(
                            width: 149,
                            height: 80,
                            text: "MSC",
                            status: "available",
                          ),
                        ],
                      ),
                      const SizedBox(height: 4, width: 7),
                      const Row(
                        children: [
                          LockerCard(
                            width: 149,
                            height: 43,
                            text: "5",
                            status: "available",
                          ),
                          SizedBox(width: 7),
                          LockerCard(
                            width: 149,
                            height: 43,
                            text: "6",
                            status: "available",
                          ),
                        ],
                      ),
                      const SizedBox(height: 4, width: 7),
                      const Row(
                        children: [
                          LockerCard(
                            width: 149,
                            height: 70,
                            text: "7",
                            status: "available",
                          ),
                          SizedBox(width: 7),
                          LockerCard(
                            width: 149,
                            height: 70,
                            text: "8",
                            status: "available",
                          ),
                        ],
                      ),
                      const SizedBox(height: 4, width: 70),
                      const Row(
                        children: [
                          LockerCard(
                            width: 305,
                            height: 70,
                            text: "9",
                            status: "available",
                          ),
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
