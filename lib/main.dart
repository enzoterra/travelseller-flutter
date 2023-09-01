import 'package:flutter/material.dart';
import 'package:travelseller/principais/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TravelSeller',
      //theme: tema,
      home: Home(),
    );
  }
}
