import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelseller/principais/clientes.dart';
import 'package:travelseller/principais/estatisticas.dart';
import 'package:travelseller/principais/viagens.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 1;
  final List<Widget> paginas = [
    const Clientes(),
    const Viagens(),
    const Estatisticas()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: paginas[currentIndex],
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 240, 240, 240),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: GNav(
                  selectedIndex: currentIndex,
                  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                  rippleColor: const Color.fromARGB(61, 41, 41, 41),
                  color: const Color.fromARGB(255, 51, 51, 51),
                  activeColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  onTabChange: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
        ));
  }
}
