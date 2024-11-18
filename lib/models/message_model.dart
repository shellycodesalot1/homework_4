class MessageModel {
  final String id;
  final String boardName;
  final String message;
  final String username;
  final DateTime datetime;

  MessageModel({
    required this.id,
    required this.boardName,
    required this.message,
    required this.username,
    required this.datetime,
  });

  // Factory method to create a MessageModel object from Firestore data
  factory MessageModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MessageModel(
      id: id,
      boardName: data['boardName'] ?? '',
      message: data['message'] ?? '',
      username: data['username'] ?? '',
      datetime: (data['datetime'] as Timestamp).toDate(),
    );
  }

  // Convert MessageModel to a Map to store in Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'boardName': boardName,
      'message': message,
      'username': username,
      'datetime': datetime,
    };
  }
}
