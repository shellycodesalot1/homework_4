import 'package:flutter/material.dart';

class Constants {
  // Firebase collection names
  static const String usersCollection = 'users';
  static const String messagesCollection = 'messages';

  // Default roles
  static const String defaultUserRole = 'user';

  // Error messages
  static const String loginFailedMessage = 'Login failed. Please check your credentials.';
  static const String registrationFailedMessage = 'Registration failed. Please try again.';
  static const String genericErrorMessage = 'Something went wrong. Please try again later.';

  // UI Strings
  static const String appName = 'Message Board App';
  static const String splashTitle = 'Welcome to Message Board App';
  static const String loginTitle = 'Login';
  static const String registerTitle = 'Register';
  static const String homeTitle = 'Message Boards';
  static const String profileTitle = 'Profile';
  static const String settingsTitle = 'Settings';

  // Default avatar
  static const String defaultAvatar = 'assets/images/default_avatar.png';

  // App theme colors
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.lightBlueAccent;
  static const Color backgroundColor = Colors.white;
}
