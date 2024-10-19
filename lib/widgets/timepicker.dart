import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Timepicker extends StatefulWidget {
  const Timepicker({super.key});

  @override
  State<Timepicker> createState() => _TimepickerState();
}

class _TimepickerState extends State<Timepicker> {
  FirebaseFirestore db = FirebaseFirestore.instance;
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
      db.collection("settings").doc("current").set(
          {"reminder_time": selectedTime.format(context)},
          SetOptions(merge: true));
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
