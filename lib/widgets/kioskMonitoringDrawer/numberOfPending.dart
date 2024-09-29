import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/transactionHistory.dart';

class numberOfPending extends StatefulWidget {
  const numberOfPending({super.key});

  @override
  State<numberOfPending> createState() => _numberOfPendingState();
}

class _numberOfPendingState extends State<numberOfPending> {
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
                MaterialPageRoute(builder: (context) => transactionHistory()),
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
              "9",
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
                // Number of pending transactions
              },
              child: const Text(
                'Number of Pending Transactions',
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
