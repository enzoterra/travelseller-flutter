import 'package:flutter/material.dart';

abstract class Tema {
  static ThemeData tema = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'Montserrat'),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 24, 134, 108),
        foregroundColor: Colors.white,
        elevation: 10),
  );
}
