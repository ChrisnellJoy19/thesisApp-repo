import 'package:flutter/material.dart';

class LockerStatus {
  static const String available = "available";
  static const String unavailable = "unavailable";
  static const String maintenance = "maintenance";
}

class LockerCard extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final String status;
  final Function()? onPressed;

  const LockerCard({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.status,
    this.onPressed,
  });

  @override
  State<LockerCard> createState() => _LockerCardState();
}

class _LockerCardState extends State<LockerCard> {
  late Color cardColor;

  @override
  void initState() {
    super.initState();
    if (widget.status != LockerStatus.available &&
        widget.status != LockerStatus.unavailable &&
        widget.status != LockerStatus.maintenance) {
      cardColor = Colors.grey;
    } else {
      cardColor = _getColorForStatus(widget.status);
    }
  }

  Color _getColorForStatus(String status) {
    switch (status) {
      case LockerStatus.available:
        return Colors.green;
      case LockerStatus.unavailable:
        return const Color.fromRGBO(103, 12, 13, 1.000);
      case LockerStatus.maintenance:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for compartment
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(widget.width, widget.height),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }
}
