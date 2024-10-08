import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final String transactionType;
  final String itemCategory;
  final String? itemSubCategory;
  final String? itemDetail;
  final String sender;
  final String senderContact;
  final String? receiver;
  final String? receiverContact;
  final DateTime dropoffDate;
  final DateTime? receivedDate;

  const TransactionCard({
    super.key,
    required this.transactionType,
    required this.itemCategory,
    required this.sender,
    required this.senderContact,
    required this.dropoffDate,
    this.itemSubCategory,
    this.itemDetail,
    this.receiver,
    this.receiverContact,
    this.receivedDate,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    bool isReceived = widget.receivedDate != null;
    String lastUpdate = isReceived
        ? DateFormat('MMMM dd, yyyy')
            .format(widget.receivedDate ?? DateTime(2000))
        : DateFormat('MMMM dd, yyyy').format(widget.dropoffDate);

    Color getAvatarColor(String transactionType) {
      switch (widget.transactionType) {
        case "regular":
          return Colors.blue.shade300;
        case "lost_and_found":
          return Colors.lime.shade300;
        default:
          return Colors.grey.shade300;
      }
    }

    String getAvatarInitials(String transactionType) {
      switch (widget.transactionType) {
        case "regular":
          return "R";
        case "lost_and_found":
          return "LF";
        default:
          return "U";
      }
    }

    return Card(
      child: ListTile(
        title: Text(widget.itemCategory),
        subtitle: Text(lastUpdate),
        leading: CircleAvatar(
          backgroundColor: getAvatarColor(widget.transactionType),
          child: Text(getAvatarInitials(widget.transactionType)),
        ),
        trailing: Chip(
          padding: const EdgeInsets.all(1.5),
          label: Text(
            isReceived ? 'Completed' : '   Pending   ',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
          backgroundColor: isReceived ? Colors.green : Colors.red,
        ),
        onTap: () {
          _showDetailsDialog(context);
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    bool isReceived = widget.receivedDate != null;
    String status = isReceived ? "Completed" : "Pending";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transaction Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.transactionType == "regular") ...[
                  buildDetailRow(
                      'Type:', cleanTransactionType(widget.transactionType)),
                  buildDetailRow('Item Category:', widget.itemCategory),
                  buildDetailRow('Status:', status),
                  buildDetailRow('Sender:', widget.sender),
                  buildDetailRow('Contact:', widget.senderContact),
                  if (widget.receiver == null)
                    buildDetailRow('Receiver:', 'No receiver'),
                  if (widget.receiver != null)
                    buildDetailRow('Receiver:', widget.receiver!),
                  if (widget.receiverContact == null)
                    buildDetailRow('Contact:', 'No contact'),
                  if (widget.receiverContact != null)
                    buildDetailRow('Contact:', widget.receiverContact!),
                  buildDetailRow(
                      'Dropoff Date:',
                      DateFormat('MMMM dd, yyyy hh:mm a')
                          .format(widget.dropoffDate)),
                  if (widget.receivedDate == null)
                    buildDetailRow('Received Date:', 'Not received'),
                  if (widget.receivedDate != null)
                    buildDetailRow(
                        'Received Date:',
                        DateFormat('MMMM dd, yyyy hh:mm a')
                            .format(widget.receivedDate!)),
                ] else if (widget.transactionType == "lost_and_found") ...[
                  buildDetailRow(
                      'Type:', cleanTransactionType(widget.transactionType)),
                  buildDetailRow('Item Category:', widget.itemCategory),
                  if (widget.itemSubCategory != null)
                    buildDetailRow('Sub-category:', widget.itemSubCategory!),
                  if (widget.itemDetail != null)
                    buildDetailRow('Detail:', widget.itemDetail!),
                  buildDetailRow('Status:', status),
                  buildDetailRow('Sender:', widget.sender),
                  buildDetailRow('Contact:', widget.senderContact),
                  if (widget.receiver != null)
                    buildDetailRow('Receiver:', widget.receiver!),
                  if (widget.receiver == null)
                    buildDetailRow('Receiver:', 'No receiver'),
                  if (widget.receiverContact == null)
                    buildDetailRow('Contact:', 'No contact'),
                  if (widget.receiverContact != null)
                    buildDetailRow('Contact:', widget.receiverContact!),
                  buildDetailRow(
                      'Dropoff Date:',
                      DateFormat('MMMM dd, yyyy hh:mm a')
                          .format(widget.dropoffDate)),
                  if (widget.receivedDate == null)
                    buildDetailRow('Received Date:', 'Not received'),
                  if (widget.receivedDate != null)
                    buildDetailRow(
                        'Received Date:',
                        DateFormat('MMMM dd, yyyy hh:mm a')
                            .format(widget.receivedDate!)),
                ] else ...[
                  const Text('Invalid transaction type'),
                ]
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
