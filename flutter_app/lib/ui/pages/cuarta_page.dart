import 'package:flutter/material.dart';

class CuartaPage extends StatefulWidget {
  const CuartaPage({super.key});

  @override
  State<CuartaPage> createState() => _CuartaPageState();
}

class _CuartaPageState extends State<CuartaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuarta Página'),
      ),
    );
  }
}