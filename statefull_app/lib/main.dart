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
          child: Nombre(),
        ),
      ),
    );
  }
}

class Nombre extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return NombreState();
  }
}

class NombreState extends State<Nombre> {
  // Definición de variables tardías
  late String texto;
  late dynamic color;
  late double fontSize;
  late dynamic fontWeight;

  // Inicializa el estado
  // Despues del build y solo acepta valores sin inicializar
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