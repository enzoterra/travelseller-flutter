import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.people)),
        BottomNavigationBarItem(icon: Icon(Icons.flight_takeoff)),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today)),
      ]),
    );
  }
}
