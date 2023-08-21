import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: const [
        BottomNavigationBarItem(label: "Clientes", icon: Icon(Icons.people)),
        BottomNavigationBarItem(label: "Viagens", icon: Icon(Icons.flight_takeoff)),
        BottomNavigationBarItem(label: "Estatísticas", icon: Icon(Icons.calendar_today)),
      ]),
    );
  }
}
