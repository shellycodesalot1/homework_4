import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  // Main Theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Constants.primaryColor,
      scaffoldBackgroundColor: Constants.backgroundColor,
      appBarTheme: const AppBarTheme(
        color: Constants.primaryColor,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Constants.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Constants.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Constants.accentColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Constants.accentColor),
    );
  }
}
