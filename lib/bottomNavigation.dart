import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget{
  const BottomNavigation({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: index, items: const [
        BottomNavigationBarItem(label: "Clientes", icon: Icon(Icons.people)),
        BottomNavigationBarItem(label: "Viagens", icon: Icon(Icons.flight_takeoff)),
        BottomNavigationBarItem(label: "Estatísticas", icon: Icon(Icons.calendar_today))
      ]);
  }

}