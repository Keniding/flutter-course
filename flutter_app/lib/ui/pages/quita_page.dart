import 'package:flutter/material.dart';

class QuintaPage extends StatefulWidget {
  const QuintaPage({super.key});

  @override
  State<QuintaPage> createState() => _QuintaPageState();
}

class _QuintaPageState extends State<QuintaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quita Página'),
      ),
    );
  }
}