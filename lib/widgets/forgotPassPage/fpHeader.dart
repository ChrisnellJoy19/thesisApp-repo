import 'package:flutter/material.dart';

class fpHeader extends StatefulWidget {
  const fpHeader({super.key});

  @override
  State<fpHeader> createState() => _fpHeaderState();
}

class _fpHeaderState extends State<fpHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "FORGOT PASSWORD",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 26,
          color: Color.fromRGBO(103, 12, 13, 1.000),
        ),
      ),
    );
  }
}
