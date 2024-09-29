import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/CAmark.dart';
import 'package:flutter_application_3/pages/LAFcompMark.dart';
import 'package:flutter_application_3/pages/dashboard.dart';
import 'package:flutter_application_3/pages/login.dart';
import 'package:flutter_application_3/pages/settings.dart';
import 'package:flutter_application_3/pages/transactionHistory.dart';

class wholeDrawer extends StatefulWidget {
  const wholeDrawer({super.key});

  @override
  State<wholeDrawer> createState() => _wholeDrawerState();
}

class _wholeDrawerState extends State<wholeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
            child: Container(
          color: const Color.fromRGBO(
              103, 12, 13, 1.000), // Dark red background color
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              const Text(
                'Kiosk Monitoring',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.white),
                      title: const Text('Home',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Navigate to SecondPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.search, color: Colors.white),
                      title: const Text('Lost & Found',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Navigate to SecondPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LAFcompMark()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.storage, color: Colors.white),
                      title: const Text('Compartment availability',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Navigate to SecondPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CAmark()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.history, color: Colors.white),
                      title: const Text('Transaction History',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Navigate to SecondPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => transactionHistory()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings, color: Colors.white),
                      title: const Text('Settings',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Navigate to SecondPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => settings()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.videocam, color: Colors.white),
                      title: const Text('CCTV Videos',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        // Add functionality here
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                leading:
                    const Icon(Icons.logout, color: Colors.white, size: 30.0),
                title: const Text('LOGOUT',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  // Navigate to SecondPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        )));
  }
}
