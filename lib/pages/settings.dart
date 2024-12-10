import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/dashboard.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/drawer_button.dart';
import 'package:flutter_application_3/widgets/timepicker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ScrollController _scrollController = ScrollController();
  String reminderTime = ''; // To store fetched reminder time

  @override
  void initState() {
    super.initState();
    _fetchReminderTime(); // Fetch reminder time when the widget is initialized
  }

  Future<void> _fetchReminderTime() async {
    try {
      // Fetch data from Firestore collection 'settings' and document 'current'
      var docSnapshot = await FirebaseFirestore.instance
          .collection('settings') // Correct collection name
          .doc('current') // 'current' document
          .get();

      print("Fetching document...");

      // Check if the document exists
      if (docSnapshot.exists) {
        print("Document Found: ${docSnapshot.id}");

        // Fetch reminder_time field
        var fetchedReminderTime = docSnapshot.data()?['reminder_time'];
        print("Fetched reminder_time: $fetchedReminderTime");

        if (fetchedReminderTime != null) {
          if (fetchedReminderTime is Timestamp) {
            // Convert Timestamp to DateTime and then to String
            setState(() {
              reminderTime = fetchedReminderTime.toDate().toString();
            });
            print("Reminder time is a Timestamp: $reminderTime");
          } else if (fetchedReminderTime is String) {
            setState(() {
              reminderTime = fetchedReminderTime;
            });
            print("Reminder time is a String: $reminderTime");
          } else {
            print("Unexpected format for reminder_time");
            setState(() {
              reminderTime = 'Unexpected format for reminder_time';
            });
          }
        } else {
          print("No reminder_time field found in document");
          setState(() {
            reminderTime = 'No reminder time found';
          });
        }
      } else {
        print("Document not found in Firestore");
        setState(() {
          reminderTime = 'Document not found';
        });
      }
    } catch (e) {
      print("Error fetching reminder time: $e");
      setState(() {
        reminderTime = 'Error fetching data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromRGBO(103, 12, 13, 1.000),
            ),
            const AppDrawerButton(),
            Container(
              height: 600,
              width: 400,
              margin: const EdgeInsets.only(
                top: 90.0,
                left: 50.0,
                right: 50.0,
                bottom: 50.0,
              ),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(103, 12, 13, 1.000),
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "REMIND TIME",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Column(
                        children: [
                          const Timepicker(),
                          const SizedBox(height: 70),
                          // Display fetched reminder time below the button
                          reminderTime.isNotEmpty
                              ? Text(
                                  'Reminder Time is set to $reminderTime',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              : const Text(
                                  'No reminder time found.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                          const SizedBox(height: 100),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
