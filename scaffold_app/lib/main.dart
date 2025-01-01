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
      // Agregamos el tema y las localizaciones
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // Movemos el Scaffold a una nueva clase HomePage
      home: const HomePage(),
    );
  }
}

// Nueva clase para la página principal
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hola, Mundo!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alerta'),
                content: const Text('Hola, Mundo!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.pink,
      body: const Center(
        child: Nombre(),
      ),
    );
  }
}

class Nombre extends StatefulWidget {
  const Nombre({super.key});

  @override
  State<StatefulWidget> createState() {
    return NombreState();
  }
}

class NombreState extends State<Nombre> {
  late String texto;
  late dynamic color;
  late double fontSize;
  late dynamic fontWeight;

  @override
  void initState() {
    super.initState();
    color = Colors.pink.shade100;
    fontSize = 30;
    fontWeight = FontWeight.bold;
  }

  @override
  Widget build(BuildContext context) {
    texto = 'Hola, Mundo modificado!';
    return Text(
      texto,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
