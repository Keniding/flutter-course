import 'dart:ui';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text(
          'Segunda Pantalla',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink.shade200,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 300,
              // Establecemos constraints para el contenedor
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8, // 80% de la altura de la pantalla
              ),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade300,
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              // Envolvemos el padding y el FormFields en un SingleChildScrollView
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: FormFields(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormFields extends StatefulWidget {
  const FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final _formKey = GlobalKey<FormState>(); // identificador del formulario
  final _nombreController = TextEditingController(); // controlador del campo de texto
  final _apellidoController = TextEditingController(); // controlador del campo de texto

  late bool _selectAction;
  late String _genero;

  @override
  void initState() {
    _selectAction = false;
    _genero = 'masculino';
    super.initState();
  }
  
  // Controladores para widget textFormField
  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _selectAction = false;
    _genero = 'masculino';
    super.dispose();
  }

  void _showSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.pink.shade300,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final apellido = _apellidoController.text;
      
      _showSnackbar('Formulario enviado: $nombre $apellido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // uso de la clave del formulario
      child: Column(
        children: [
          TextFormField(
            controller: _nombreController, // asignar el controlador al campo de texto
            decoration: const InputDecoration(
              labelText: 'Nombre',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorStyle: TextStyle(color: Colors.white70),
            ),
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField( 
            controller: _apellidoController,
            decoration: const InputDecoration( // Decoracion del campo de texto
              border: OutlineInputBorder(),
              labelText: 'Apellido', 
              hintText: 'Ej. Tarazona',
              labelStyle: TextStyle(color: Colors.white),
              errorStyle: TextStyle(color: Colors.white70),
            ),
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu apellido';
              }
              return null;
            },
            onChanged: (valor) => {
            },
          ),
          const SizedBox(height: 30),
          ListTile(
            title: const Text(
              'Eres nuevo?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: const Text(
              'Registrate ahora!',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            leading: Checkbox( // leading es el widget que se coloca a la izquierda del ListTile
              value: _selectAction, 
              onChanged: (valor) => {
                setState(() { // Para actualizar estados
                  _selectAction = valor!; // Cambiar el valor del checkbox a true o false
                }),
                _showSnackbar('Registro completado $valor!'), 
              },
            )
          ),
          const SizedBox(height: 30),
          const Text(
            'Selecciona tu género',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          ListTile(
            title: const Text(
              'Masculino',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Radio( // trailing es el widget que se coloca a la derecha del ListTile
              groupValue: _genero, 
              value: 'masculino', 
              onChanged: (valor) => {
                setState(() {
                  _genero = valor.toString();
                }),
                _showSnackbar('Género seleccionado: $valor'), 
              },
            ) 
          ),
          ListTile(
            title: const Text(
              'Femenino',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Radio(
              groupValue: _genero, 
              value: 'femenino', 
              onChanged: (valor) => {
                setState(() {
                  _genero = valor.toString();
                }),
                _showSnackbar('Género seleccionado: $valor'), 
              },
            ) 
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.pink.shade100,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.pink.shade400,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Enviar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
