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

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width *
            0.7, // Change the width to 70% of the screen width
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(00.0),
          ),
          child: Container(
            color:
                Color.fromRGBO(103, 12, 13, 1.000), // Dark red background color
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                Text(
                  'Kiosk Monitoring',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title:
                            Text('Home', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.search, color: Colors.white),
                        title: Text('Lost & Found',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.storage, color: Colors.white),
                        title: Text('Compartment availability',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.history, color: Colors.white),
                        title: Text('Transaction History',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings, color: Colors.white),
                        title: Text('Settings',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.videocam, color: Colors.white),
                        title: Text('CCTV Videos',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Add functionality here
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white, size: 30.0),
                  title: Text('LOGOUT',
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
              color: Color.fromRGBO(103, 12, 13, 1.000),
            ),
            Positioned(
              top: 1,
              right: 8,
              child: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0, // Adjust the icon size here
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    color: Colors.white, // Icon color
                  );
                },
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 600,
              width: 400,
              margin: EdgeInsets.only(
                  top: 90.0,
                  left: 50.0,
                  right: 50.0,
                  bottom: 50.0), // Margin to make the border visible
              padding: EdgeInsets.only(
                  top:
                      30), // Padding to start the border below the top container
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(103, 12, 13, 1.000), // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME!",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'mm/dd/yy',
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Space between date and button
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality for number of transaction
                              },
                              child: Text(
                                "6",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  color: Color.fromRGBO(255, 255, 255, 1.000),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(103, 12, 13, 1.000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize:
                                    Size(70, 80), // Fixed size for the button
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: TextButton(
                                onPressed: () {
                                  // Number of transactions
                                },
                                child: Text(
                                  'Number of Transactions',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 10), // Reduced space between text and button
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality for number of pending transactions
                              },
                              child: Text(
                                "9",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  color: Color.fromRGBO(255, 255, 255, 1.000),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(103, 12, 13, 1.000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize:
                                    Size(70, 80), // Fixed size for the button
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: TextButton(
                                onPressed: () {
                                  // Number of pending transactions
                                },
                                child: Text(
                                  'Number of Pending Transactions',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Reduced space between the text and button
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality for number of pending transaction
                              },
                              child: Text(
                                "12",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  color: Color.fromRGBO(255, 255, 255, 1.000),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(103, 12, 13, 1.000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize:
                                    Size(70, 80), // Fixed size for the button
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: TextButton(
                                onPressed: () {
                                  // Number of pending transaction
                                },
                                child: Text(
                                  'Number of Pending Transaction',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
