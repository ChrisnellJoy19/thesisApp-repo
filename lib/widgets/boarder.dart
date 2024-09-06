import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/availabelCompartments.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/date.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/menuButton.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/numberOfPending.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/numberOfTransactions.dart';

class boarderLine extends StatefulWidget {
  const boarderLine(
      Text text,
      date date,
      SizedBox sizedBox,
      numberOfTransactions numberOfTransactions,
      gsizedBox,
      numberOfPending numberOfPending,
      SizedBox,
      availableCompartments availableCompartments,
      {super.key});

  @override
  State<boarderLine> createState() => _boarderLineState();
}

class _boarderLineState extends State<boarderLine> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromRGBO(103, 12, 13, 1.000),
          ),
          const menuButton(),
          Container(
            height: 600,
            width: 400,
            margin: const EdgeInsets.only(
                top: 90.0,
                left: 50.0,
                right: 50.0,
                bottom: 50.0), // Margin to make the border visible
            padding: const EdgeInsets.only(
                top: 30), // Padding to start the border below the top container
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(103, 12, 13, 1.000), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
