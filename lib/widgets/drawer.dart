import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/dashboard.dart';
import 'package:flutter_application_3/pages/compartments.dart';
import 'package:flutter_application_3/pages/transactions.dart';
import 'package:flutter_application_3/pages/settings.dart';
import 'package:flutter_application_3/pages/login.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Container(
          color: const Color.fromRGBO(103, 12, 13, 1.000),
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
                      title: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.storage, color: Colors.white),
                      title: const Text(
                        'Compartments',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Compartments(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.history, color: Colors.white),
                      title: const Text(
                        'Transaction History',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Transactions(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings, color: Colors.white),
                      title: const Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.videocam, color: Colors.white),
                      title: const Text(
                        'CCTV Videos',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              ListTile(
                leading:
                    const Icon(Icons.logout, color: Colors.white, size: 30.0),
                title: const Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
