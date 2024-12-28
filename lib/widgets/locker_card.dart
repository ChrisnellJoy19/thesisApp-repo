import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LockerStatus {
  static const String available = "available";
  static const String unavailable = "unavailable";
  static const String maintenance = "maintenance";

  static List<String> getStatusList() {
    return [available, unavailable, maintenance];
  }
}

class LockerCard extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final String status;
  final Function()? onPressed;
  final Function(String newStatus)? onStatusChanged;

  const LockerCard({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.status,
    this.onPressed,
    this.onStatusChanged,
  });

  @override
  State<LockerCard> createState() => _LockerCardState();
}

class _LockerCardState extends State<LockerCard> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late Color cardColor;
  String? selectedStatus;

  @override
  void initState() {
    cardColor = _getColorForStatus(widget.status);
    selectedStatus = widget.status;
    super.initState();
  }

  Color _getColorForStatus(String status) {
    switch (status) {
      case LockerStatus.available:
        return Colors.green;
      case LockerStatus.unavailable:
        return const Color.fromRGBO(103, 12, 13, 1.000);
      case LockerStatus.maintenance:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final transaction = await getPendingTransaction(widget.text);
        showTransactionDialog(context, transaction);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(widget.width, widget.height),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1.000),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> getPendingTransaction(
      String compartmentId) async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection('transactions')
          .where('compartment_id', isEqualTo: compartmentId)
          .where('status', isEqualTo: 'pending')
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching pending transaction: $e");
      return null;
    }
  }

  void showTransactionDialog(
      BuildContext context, Map<String, dynamic>? transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(transaction == null
                  ? "No Pending Transaction"
                  : "Transaction Details"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (transaction == null)
                    const Text(
                      "No pending transaction for this compartment.",
                      textAlign: TextAlign.center,
                    )
                  else
                    Column(
                      children: [
                        buildDetailRow(
                            "Transaction Type:",
                            cleanTransactionType(
                                transaction["transaction_type"] ?? "N/A")),
                        // buildDetailRow("Item Category:",
                        //     transaction["item_category"] ?? "N/A"),
                        buildDetailRow(
                            "Sender:", transaction["sender"] ?? "N/A"),
                        buildDetailRow("Sender Contact:",
                            transaction["sender_contact"] ?? "N/A"),
                        buildDetailRow(
                            "Receiver:", transaction["receiver"] ?? "N/A"),
                        buildDetailRow("Receiver Contact:",
                            transaction["receiver_contact"] ?? "N/A"),
                        buildDetailRow(
                            "Dropoff Date:",
                            (transaction["dropoff_at"] != null
                                ? (transaction["dropoff_at"] as Timestamp)
                                    .toDate()
                                    .toString()
                                : "N/A")),
                        buildDetailRow(
                            "Received Date:",
                            (transaction["received_at"] != null
                                ? (transaction["received_at"] as Timestamp)
                                    .toDate()
                                    .toString()
                                : "N/A")),
                      ],
                    ),
                  const SizedBox(height: 16),
                  // const Text("Change Compartment Status:"),
                  // DropdownButton<String>(
                  //   value: selectedStatus,
                  //   items: LockerStatus.getStatusList().map((String status) {
                  //     return DropdownMenuItem<String>(
                  //       value: status,
                  //       child: Text(status),
                  //     );
                  //   }).toList(),
                  //   onChanged: (newStatus) {
                  //     setState(() {
                  //       selectedStatus = newStatus;
                  //     });
                  //   },
                  // ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     if (selectedStatus != null) {
                //       await updateCompartmentStatus(
                //           widget.text, selectedStatus!);
                //       setState(() {
                //         cardColor = _getColorForStatus(selectedStatus!);
                //       });
                //       Navigator.of(context).pop();
                //     }
                //   },
                //   child: const Text("Save"),
                // ),
              ],
            );
          },
        );
      },
    );
  }

  String cleanTransactionType(String transactionType) {
    switch (transactionType) {
      case "regular":
        return "Regular";
      case "lost_and_found":
        return "Lost and Found";
      default:
        return "Unknown";
    }
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateCompartmentStatus(
      String compartmentId, String newStatus) async {
    try {
      await db.collection('compartments').doc(compartmentId).update(
          {'status': newStatus, 'updated_at': FieldValue.serverTimestamp()});
      print("Compartment status updated successfully.");

      setState(() {
        cardColor = _getColorForStatus(newStatus);
      });

      if (widget.onStatusChanged != null) {
        widget.onStatusChanged!(newStatus);
      }
    } catch (e) {
      print("Error updating compartment status: $e");
    }
  }
}
