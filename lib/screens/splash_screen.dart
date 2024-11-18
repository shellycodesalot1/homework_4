import 'package:flutter/material.dart';
import 'dart:async'; // For Future.delayed

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a delay before navigating to the next screen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a logo
            Image.asset(
              'assets/images/chat_logo.png', // Update with your asset path
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),

            // Add a loading indicator or app title
            Text(
              'Welcome to My App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),

            CircularProgressIndicator(), // Show a loading spinner
          ],
        ),
      ),
    );
  }
}
