import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/drawer_button.dart';
import 'package:flutter_application_3/widgets/transaction_card.dart';

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
  List<Map<String, dynamic>> filteredTransactions = [];

  String selectedTransactionType = 'All';
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  void fetchTransactions() {
    setState(() {
      isLoading = true;
    });
    final transactionsRef = db.collection("transactions");
    transactionsRef.get().then(
      (querySnapshot) {
        setState(() {
          transactions = querySnapshot.docs
              .map((docSnapshot) => docSnapshot.data() as Map<String, dynamic>)
              .toList();
          filteredTransactions = transactions;
        });
        isLoading = false;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  void filterTransactions(String transactionType) {
    setState(() {
      selectedTransactionType = transactionType;
      applyFilters();
    });
  }

  void applyFilters() {
    setState(() {
      filteredTransactions = transactions.where((transaction) {
        bool matchesType = selectedTransactionType == 'All' ||
            transaction["transaction_type"] == selectedTransactionType;
        DateTime dropoffDate = transaction["dropoff_at"].toDate();
        bool matchesDate = true;
        if (startDate != null) {
          matchesDate = matchesDate && dropoffDate.isAfter(startDate!);
        }
        if (endDate != null) {
          matchesDate = matchesDate && dropoffDate.isBefore(endDate!);
        }

        return matchesType && matchesDate;
      }).toList();
    });
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
        applyFilters();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
        applyFilters();
      });
    }
  }

  void clearFilters() {
    setState(() {
      selectedTransactionType = 'All';
      startDate = null;
      endDate = null;
      filteredTransactions = transactions;
    });
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
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedTransactionType,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'All',
                                      child: Text('All Transactions'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'regular',
                                      child: Text('Regular'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'lost_and_found',
                                      child: Text('Lost and Found'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value != null) {
                                      filterTransactions(value);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: clearFilters,
                                icon: const Icon(Icons.clear_all_outlined),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => _selectStartDate(context),
                                child: Text(
                                  startDate == null
                                      ? "Select Start Date"
                                      : DateFormat('MMMM dd, yyyy')
                                          .format(startDate!),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => _selectEndDate(context),
                                child: Text(
                                  endDate == null
                                      ? "Select End Date"
                                      : DateFormat('MMMM dd, yyyy')
                                          .format(endDate!),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: List.generate(
                                filteredTransactions.length,
                                (index) => TransactionCard(
                                  transactionType: filteredTransactions[index]
                                      ["transaction_type"],
                                  itemCategory: filteredTransactions[index]
                                      ["item_category"],
                                  itemSubCategory: filteredTransactions[index]
                                      ["item_subcategory"],
                                  itemDetail: filteredTransactions[index]
                                      ["item_detail"],
                                  sender: filteredTransactions[index]["sender"],
                                  senderContact: filteredTransactions[index]
                                      ["sender_contact"],
                                  receiver: filteredTransactions[index]
                                      ["receiver"],
                                  receiverContact: filteredTransactions[index]
                                      ["receiver_contact"],
                                  dropoffDate: filteredTransactions[index]
                                          ["dropoff_at"]
                                      .toDate(),
                                  receivedDate: filteredTransactions[index]
                                          ["received_at"]
                                      ?.toDate(),
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
