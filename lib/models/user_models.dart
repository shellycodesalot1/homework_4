class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final DateTime registrationDatetime;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.registrationDatetime,
  });

  // Factory method to create a UserModel object from Firestore data
  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? 'user',
      registrationDatetime: (data['registrationDatetime'] as Timestamp).toDate(),
    );
  }

  // Convert UserModel to a Map to store in Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'registrationDatetime': registrationDatetime,
    };
  }
}
