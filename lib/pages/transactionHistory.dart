import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/menuButton.dart';
import 'package:flutter_application_3/widgets/kioskMonitoringDrawer/wholeDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: transactionHistory(),
    );
  }
}

class transactionHistory extends StatefulWidget {
  const transactionHistory({super.key});

  @override
  _transactionHistoryState createState() => _transactionHistoryState();
}

class _transactionHistoryState extends State<transactionHistory> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: wholeDrawer(),
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
            const menuButton(),
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
                  const SizedBox(height: 10),
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
