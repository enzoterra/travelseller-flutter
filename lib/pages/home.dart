import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelseller/pages/clientes.dart';
import 'package:travelseller/pages/estatisticas.dart';
import 'package:travelseller/pages/viagens.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int navIndex = 1;
  final List<Widget> paginas = [
    const Clientes(),
    const Viagens(),
    const Estatisticas()
  ];

  @override
  void initState() {
    navIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: paginas[navIndex],
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 240, 240, 240),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: GNav(
                  selectedIndex: navIndex,
                  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                  rippleColor: const Color.fromARGB(61, 41, 41, 41),
                  color: const Color.fromARGB(255, 51, 51, 51),
                  activeColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  gap: 10,
                  tabBorderRadius: 6,
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
                      navIndex = index;
                    });
                  })),
        ));
  }
}