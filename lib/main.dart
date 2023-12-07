import 'package:flutter/material.dart';
import 'package:travelseller/principais/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelSeller',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 24, 134, 108),
            foregroundColor: Colors.white,
            elevation: 10),
      ),
      home: const Home(),
    );
  }
}
