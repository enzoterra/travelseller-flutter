import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget{
  const BottomNavigation({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[800], // tab button ripple color when pressed
        hoverColor: Colors.grey[700], // tab button hover color
        tabBorderRadius: 15, 
        tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
        tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
        selectedIndex: index,
        iconSize: 24,
        padding: const EdgeInsets.all(16),
        gap: 10,
        tabs: const [
          GButton(icon: Icons.people, text: "Clientes",),
          GButton(icon: Icons.flight_takeoff, text: "Viagens",),
          GButton(icon: Icons.calendar_today, text: "Estatísticas",),
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