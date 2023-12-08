import 'package:flutter/material.dart';

class Tema extends StatelessWidget {
  final tema = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 24),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 24, 134, 108),
        foregroundColor: Colors.white,
        elevation: 10),
  );

  Tema({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
