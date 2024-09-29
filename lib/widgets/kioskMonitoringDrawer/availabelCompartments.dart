import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/compartmentAvailability.dart';

class availableCompartments extends StatefulWidget {
  const availableCompartments({super.key});

  @override
  State<availableCompartments> createState() => _availableCompartmentsState();
}

class _availableCompartmentsState extends State<availableCompartments> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to SecondPage when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => compartmentAvailability()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              minimumSize: const Size(70, 80), // Fixed size for the button
            ),
            child: const Text(
              "12",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1.000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: TextButton(
              onPressed: () {
                // Number of pending transaction
              },
              child: const Text(
                'Available Compartments',
                style: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
