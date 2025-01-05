import 'dart:ui';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class AppTheme {
  // Constantes para colores y valores reutilizables
  static const _primaryColor = Colors.pink;
  
  // Tema Claro
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _primaryColor.shade200,
      ),
      scaffoldBackgroundColor: Colors.white,
      // Personalización de componentes específicos
      appBarTheme: const AppBarTheme(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
      // Tipografía
      textTheme: const TextTheme(
        // Definir estilos de texto consistentes
        headlineLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Tema Oscuro
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _primaryColor.shade700,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      // Personalización de componentes para modo oscuro
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
      // Tipografía para modo oscuro
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: CustomFloatingButton(),
      backgroundColor: Colors.pink,
      body: Center(
        child: 
        //GreetingText(), 
        ContainerWidget(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Hola, Mundo!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.pink.shade200,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAlert(context),
      child: const Icon(Icons.add),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const CustomAlertDialog(),
    );
  }
}

class GreetingText extends StatefulWidget {
  const GreetingText({super.key});

  @override
  State<GreetingText> createState() => _GreetingTextState();
}

class _GreetingTextState extends State<GreetingText> {
  static const double _fontSize = 20;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hola, Mundo modificado!',
      style: TextStyle(
        color: Colors.pink.shade100,
        fontSize: _fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(30),
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
          child: const SingleChildScrollView( // Scroll para contenido desbordado
            child: Column( // Column para mas de 1 widget hijo
              children: [
                RowWidget(),
                SizedBox(height: 20),
                ColumnWidget(),
                SizedBox(height: 20),
                StackWidget(),
                SizedBox(height: 20),
                ButttonWithSnackBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.pink.shade200,
            Colors.white.withOpacity(0.5),
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
        onPressed: () => _showAlert(context),
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
          'Presionar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const CustomAlertDialog(),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,    // Alineación VERTICAL (eje principal)
      crossAxisAlignment: CrossAxisAlignment.start,   // Alineación HORIZONTAL (eje cruzado)
      children: [
        GreetingText(),
        SizedBox(height: 20),
        CustomTextButton(),
        SizedBox(height: 20),
        CustomTextButton(),
        SizedBox(height: 20),
        CustomTextButton(),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextButton(),
          SizedBox(width: 10),
          CustomTextButton(),
          SizedBox(width: 10),
          CustomTextButton(),
        ],
      ),
    );
  }
}

// Encima de todos los widgets y con posición absoluta (posición relativa al padre)
// El primer widget hijo se dibuja en la parte inferior, el último en la parte superior
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Contenedor base (fondo)
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
          color: Colors.pink.shade600,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Contenedor Base',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        
        // Contenedor superior izquierdo
        Positioned(
          top: 20,  // 20 píxeles desde arriba
          left: 20, // 20 píxeles desde la izquierda
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Superior\nIzquierda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        
        // Contenedor inferior derecho
        Positioned(
          bottom: 20, // 20 píxeles desde abajo
          right: 20,  // 20 píxeles desde la derecha
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Inferior\nDerecha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Ejemplo de uso de un widget de informacion
// Elimina la clase CoustomSnackbar y reemplázala con esta implementación:
class ButttonWithSnackBarWidget extends StatelessWidget {
  const ButttonWithSnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hola, Mundo esto es un snackbar!'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: const Text('Mostrar Snackbar'),
    );
  }
}

// Alerta
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero, // Elimina el padding predeterminado del título}
      // title: const Text('Alerta'), // antes de hacer con Padding
      title: Stack(
        alignment: Alignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Alerta'),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      content: const Text('Hola, Mundo!'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cerrar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
