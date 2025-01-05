// stl less
// stf full
import 'package:flutter/material.dart';

class TercerPage extends StatefulWidget {
  const TercerPage({super.key});

  @override
  State<TercerPage> createState() => _TercerPageState();
}

class _TercerPageState extends State<TercerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // Botón de navegación no necesario porque Flutter lo agrega automáticamente
          icon: const Icon(Icons.arrow_back_ios), // Con fines de prueba solo para comprobar que se puede agregar
          onPressed: () {
            Navigator.pop(context); // Navegación a la página anterior (pop) explicitamente
          },
        ), // Borrar no es necesario
        title: const Text('Tercer Page'),
        ),
        body: Container(
          color: Colors.pink,
          child: const Center(
            child: Text('Tercer Page'),
          ),
        ),
    );
  }
}
