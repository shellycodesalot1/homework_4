import 'package:intl/intl.dart';

class Helpers {
  // Format DateTime to readable string
  static String formatDateTime(DateTime datetime) {
    return DateFormat('MMM d, yyyy h:mm a').format(datetime);
  }

  // Capitalize the first letter of a string
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  // Validate email format
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }
}

