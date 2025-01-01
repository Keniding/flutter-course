import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: Center(
          child: PrimerWidget(),
          /*
          Text(
            'Hello, World!',
            style: TextStyle(color: Colors.white70),
          ),
          */
        ),
      ),
    );
  }
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:645404891.
class PrimerWidget extends StatelessWidget {
  const PrimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My primer widget',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
