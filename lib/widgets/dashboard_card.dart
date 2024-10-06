import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  final String value;
  final String label;
  final Function() onPressed;
  const DashboardCard({
    super.key,
    required this.value,
    required this.label,
    required this.onPressed,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(103, 12, 13, 1.000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: const Size(70, 80),
          ),
          child: Text(
            widget.value,
            style: const TextStyle(
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
            child: Text(
              widget.label,
              style: const TextStyle(
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
    );
  }
}
