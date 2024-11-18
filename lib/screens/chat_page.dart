import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  final String boardName;

  const ChatPage({super.key, required this.boardName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();

  Future<void> sendMessage() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (_messageController.text.trim().isNotEmpty && user != null) {
      await FirebaseFirestore.instance.collection('messages').add({
        'boardName': widget.boardName,
        'message': _messageController.text.trim(),
        'username': user.email,
        'datetime': DateTime.now(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.boardName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .where('boardName', isEqualTo: widget.boardName)
                  .orderBy('datetime', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView(
                  reverse: true,
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['message']),
                      subtitle: Text('${doc['username']} - ${doc['datetime'].toDate()}'),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(hintText: 'Enter your message...'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
