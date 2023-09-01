import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelseller/principais/clientes.dart';
import 'package:travelseller/principais/estatisticas.dart';
import 'package:travelseller/principais/viagens.dart';

class BottomNavigation extends StatelessWidget {
  final int indexPag;
  static const Widget clientes = Clientes();
  static const Widget viagens = Viagens();
  static const Widget estatisticas = Estatisticas();

  const BottomNavigation({
    Key? key,
    required this.indexPag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 240, 240),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: GNav(
            selectedIndex: indexPag,
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            rippleColor: const Color.fromARGB(61, 41, 41, 41),
            color: const Color.fromARGB(255, 51, 51, 51),
            activeColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            gap: 10,
            tabs: const [
              GButton(
                icon: Icons.people,
                text: "Clientes",
                backgroundGradient: LinearGradient(colors: [
                  Color.fromRGBO(50, 153, 172, 1),
                  Color.fromRGBO(35, 168, 103, 1)
                ]),
              ),
              GButton(
                icon: Icons.flight_takeoff,
                text: "Viagens",
                backgroundGradient: LinearGradient(colors: [
                  Color.fromRGBO(2, 52, 139, 1),
                  Color.fromRGBO(76, 0, 108, 1)
                ]),
              ),
              GButton(
                icon: Icons.calendar_today,
                text: "Estatísticas",
                backgroundGradient: LinearGradient(colors: [
                  Color.fromRGBO(33, 41, 166, 1),
                  Color.fromRGBO(226, 193, 4, 1)
                ]),
              ),
            ],
            /*onTabChange: (index) {
              switch (index) {
                case 0:
                  return Layoutclientes;
                case 1:
                  return viagens;
                case 2:
                  return estatisticas;
              }
            },*/
          )),
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