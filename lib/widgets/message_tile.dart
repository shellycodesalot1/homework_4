import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final String sender;
  final DateTime timestamp;

  const MessageTile({
    super.key,
    required this.message,
    required this.sender,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '$sender • ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
