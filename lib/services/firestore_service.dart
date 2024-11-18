import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch user data by ID
  Future<UserModel?> fetchUser(String userId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return UserModel.fromFirestore(snapshot.data() as Map<String, dynamic>, userId);
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }

  // Update user data
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).update(data);
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  // Fetch messages for a specific board
  Future<List<MessageModel>> fetchMessages(String boardName) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('messages')
          .where('boardName', isEqualTo: boardName)
          .orderBy('datetime', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        return MessageModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching messages: $e');
      return [];
    }
  }

  // Add a new message
  Future<void> addMessage(MessageModel message) async {
    try {
      await _firestore.collection('messages').add(message.toFirestore());
    } catch (e) {
      print('Error adding message: $e');
    }
  }
}
