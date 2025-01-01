import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Material para android, cuppertino para IOs
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
  const Nombre({super.key});

  @override
  State<StatefulWidget> createState(){
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