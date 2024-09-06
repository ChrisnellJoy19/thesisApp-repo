import 'package:flutter/material.dart';

class numberOfTransactions extends StatefulWidget {
  const numberOfTransactions({super.key});

  @override
  State<numberOfTransactions> createState() => _numberOfTransactionsState();
}

class _numberOfTransactionsState extends State<numberOfTransactions> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Add functionality for number of transaction
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              minimumSize: const Size(70, 80), // Fixed size for the button
            ),
            child: const Text(
              "6",
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
                // Number of transactions
              },
              child: const Text(
                'Number of Transactions',
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
