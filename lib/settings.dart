import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
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
    return Scaffold(
      drawer: Container(
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
                        title: const Text('Home',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.search, color: Colors.white),
                        title: const Text('Lost & Found',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.storage, color: Colors.white),
                        title: const Text('Compartment availability',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.history, color: Colors.white),
                        title: const Text('Transaction History',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.settings, color: Colors.white),
                        title: const Text('Settings',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.videocam, color: Colors.white),
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
                    // Add functionality here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30.0,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    color: Colors.white,
                  );
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

                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "REMIND TIME",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 24,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 3), // Space between text and time picker
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
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
                            ),
                            const SizedBox(
                                height: 100), // Space between button and switch
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
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
                            ),
                            const SizedBox(
                                height: 6), // Space between text and switch
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'OFF',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width: 10), // Space between text and switch
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeColor:
                                      const Color.fromRGBO(103, 12, 13, 1.000),
                                ),
                                const SizedBox(
                                    width: 10), // Space between switch and text
                                const Text(
                                  'ON',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
