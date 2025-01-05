import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/cuarta_page.dart';
import 'package:flutter_app/ui/pages/primera_page.dart';
import 'package:flutter_app/ui/pages/quita_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Opcion 2 navegación por rutas nombradas (Named Routes) por alias
      routes: {
        '/cuarta': (context) => const CuartaPage(),
        '/quinta': (context) => const QuintaPage(),
      },
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
        child: ContainerWidget(),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: NavigationButton(),
      ),
    );
  }
}
