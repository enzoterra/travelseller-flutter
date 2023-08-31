import 'package:flutter/material.dart';
import 'package:travelseller/viagens.dart';
import 'package:travelseller/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelSeller',
      theme: tema,
      home: const Viagens(),
    );
  }
}
