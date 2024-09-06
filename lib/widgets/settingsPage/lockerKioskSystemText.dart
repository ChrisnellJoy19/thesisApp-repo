import 'package:flutter/material.dart';

class lockerKioskSystemText extends StatefulWidget {
  const lockerKioskSystemText({super.key});

  @override
  State<lockerKioskSystemText> createState() => _lockerKioskSystemTextState();
}

class _lockerKioskSystemTextState extends State<lockerKioskSystemText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'LOCKER KIOSK SYSTEM',
        style: TextStyle(
          fontFamily: "Inter",
          fontStyle: FontStyle.italic,
          fontSize: 24,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
