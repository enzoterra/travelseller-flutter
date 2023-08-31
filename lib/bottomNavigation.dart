import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget{
  const BottomNavigation({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(
        tabs: [
          GButton(icon: Icons.people),
          GButton(icon: Icons.flight_takeoff),
          GButton(icon: Icons.calendar_today),
        ]
      )
    );
  }

  /*
  bottomNavigationBar: BottomNavigationBar(currentIndex: index, items: const [
    BottomNavigationBarItem(label: "Clientes", icon: Icon(Icons.people)),
    BottomNavigationBarItem(label: "Viagens", icon: Icon(Icons.flight_takeoff)),
    BottomNavigationBarItem(label: "Estatísticas", icon: Icon(Icons.calendar_today))
  ])
  */

}