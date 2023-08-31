import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget{
  const BottomNavigation({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: const Color.fromARGB(255, 19, 28, 110),
      rippleColor: const Color.fromARGB(61, 41, 41, 41),
      color: const Color.fromARGB(255, 212, 212, 212),
      activeColor: Colors.white,
      tabBorderRadius: 15, 
      selectedIndex: index,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      gap: 10,
      tabs: const [
        GButton(icon: Icons.people, text: "Clientes",),
        GButton(icon: Icons.flight_takeoff, text: "Viagens",),
        GButton(icon: Icons.calendar_today, text: "Estatísticas",),
      ]
    );
  }
}

  /*
  bottomNavigationBar: BottomNavigationBar(currentIndex: index, items: const [
    BottomNavigationBarItem(label: "Clientes", icon: Icon(Icons.people)),
    BottomNavigationBarItem(label: "Viagens", icon: Icon(Icons.flight_takeoff)),
    BottomNavigationBarItem(label: "Estatísticas", icon: Icon(Icons.calendar_today))
  ])
  */