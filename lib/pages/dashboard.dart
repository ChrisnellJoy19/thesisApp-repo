import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/drawer_button.dart';
import 'package:flutter_application_3/widgets/dashboard_card.dart';
import 'package:flutter_application_3/pages/transactions.dart';
import 'package:flutter_application_3/pages/compartments.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  int transactions = 0;
  int pendingTransactions = 0;
  int availableCompartments = 0;

  @override
  void initState() {
    final transactionsRef = db.collection("transactions");
    transactionsRef.get().then(
      (querySnapshot) {
        setState(() {
          transactions = querySnapshot.docs.length;
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.data()["received_at"] == null) {
              pendingTransactions += 1;
            }
          }
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
    final compartmentsRef = db.collection("compartments");
    compartmentsRef.get().then(
      (querySnapshot) {
        setState(() {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.data()["status"] == "available") {
              availableCompartments += 1;
            }
          }
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
    super.initState();
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
              padding: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(103, 12, 13, 1.000),
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "WELCOME!",
                        style: const TextStyle(
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
                              DateFormat('MMMM dd, yyyy')
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                fontFamily: "Inter",
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            DashboardCard(
                              value: transactions.toString(),
                              label: "Number of Transactions",
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Transactions(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            DashboardCard(
                              value: pendingTransactions.toString(),
                              label: "Number of Pending Transactions",
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Transactions(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            DashboardCard(
                              value: availableCompartments.toString(),
                              label: "Available",
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Compartments(),
                                  ),
                                );
                              },
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
