import 'package:flutter/material.dart';

class setTime extends StatefulWidget {
  const setTime({super.key});

  @override
  State<setTime> createState() => _setTimeState();
}

class _setTimeState extends State<setTime> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isSwitched = false;

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(103, 12, 13, 1.000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () => _selectTime(context),
        child: Text(
          'Set Time: ${selectedTime.format(context)}',
          style: const TextStyle(
            fontFamily: "Inter",
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
