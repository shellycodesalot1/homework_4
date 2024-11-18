import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> boards = [
    {'name': 'General', 'icon': 'assets/images/general.png'},
    {'name': 'Tech Talk', 'icon': 'assets/images/tech.png'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Boards')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(boards[index]['icon']!),
            title: Text(boards[index]['name']!),
            onTap: () {
              Navigator.pushNamed(context, '/chat', arguments: boards[index]['name']);
            },
          );
        },
      ),
    );
  }
}
