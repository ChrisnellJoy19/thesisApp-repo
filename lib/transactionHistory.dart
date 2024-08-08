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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(103, 12, 13, 1.000),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        "TRANSACTION HISTORY",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromRGBO(103, 12, 13, 1.000),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => Card(
                            child: ListTile(
                              title: const Text('Transaction Type:'),
                              subtitle: const Text('Date:'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                // Add functionality here
                              },
                            ),
                          ),
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
    );
  }
}
