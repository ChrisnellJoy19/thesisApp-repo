import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/wholeDrawer.dart';
import 'package:flutter_application_3/widgets/loginPage/backButton.dart';
import 'package:flutter_application_3/widgets/settingsPage/lockerKioskSystemText.dart';
import 'package:flutter_application_3/widgets/settingsPage/onAndOff.dart';
import 'package:flutter_application_3/widgets/settingsPage/reminderText.dart';
import 'package:flutter_application_3/widgets/settingsPage/setTime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: settings(),
    );
  }
}

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  final ScrollController _scrollController = ScrollController();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const wholeDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromRGBO(103, 12, 13, 1.000),
            ),
            Positioned(
              top: 1,
              right: 8,
              child: Builder(
                builder: (context) {
                  return const backButton();
                },
              ),
            ),
            Container(
              height: 600,
              width: 400,
              margin: const EdgeInsets.only(
                  top: 90.0,
                  left: 50.0,
                  right: 50.0,
                  bottom: 50.0), // Margin to make the border visible
              padding: const EdgeInsets.only(
                  top:
                      10), // Padding to start the border below the top container
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      const Color.fromRGBO(103, 12, 13, 1.000), // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      const SizedBox(height: 20),
                      const reminderText(),
                      const SizedBox(
                          height: 3), // Space between text and time picker
                      const Center(
                        child: Column(
                          children: [
                            setTime(),
                            SizedBox(
                                height: 100), // Space between button and switch
                            lockerKioskSystemText(),
                            SizedBox(
                                height: 6), // Space between text and switch
                            onAndOff(),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height:
                              20), // Space between switch and additional content
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
