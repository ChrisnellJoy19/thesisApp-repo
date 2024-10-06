import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/drawer_button.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final ScrollController _scrollController = ScrollController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    isLoading = true;
    final transactionsRef = db.collection("transactions");
    transactionsRef.get().then(
      (querySnapshot) {
        setState(() {
          for (var docSnapshot in querySnapshot.docs) {
            transactions.add(docSnapshot.data());
          }
        });
        isLoading = false;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const AppDrawer(),
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
                  const AppDrawerButton(),
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
                        const SizedBox(height: 36),
                        Container(
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
                        const SizedBox(height: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: List.generate(
                                transactions.length,
                                (index) {
                                  bool received = transactions[index]
                                          ["received_at"] !=
                                      null;
                                  String lastUpdate = received
                                      ? DateFormat('MM/dd/yyyy hh:mm a').format(
                                          transactions[index]["received_at"]
                                              .toDate())
                                      : DateFormat('MM/dd/yyyy hh:mm a').format(
                                          transactions[index]["dropoff_at"]
                                              .toDate());
                                  return Card(
                                    child: ListTile(
                                      title: Text(transactions[index]
                                              ["item_category"] ??
                                          "Unknown"),
                                      subtitle: Text("Updated: $lastUpdate"),
                                      trailing: Chip(
                                        padding: const EdgeInsets.all(1.5),
                                        label: Text(
                                          received
                                              ? 'Completed'
                                              : '   Pending   ',
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        backgroundColor: received
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      onTap: () {
                                        // Add functionality here
                                      },
                                    ),
                                  );
                                },
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
