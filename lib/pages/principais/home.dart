import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/pages/principais/clientes.dart';
import 'package:travelseller/pages/principais/estatisticas.dart';
import 'package:travelseller/pages/principais/viagens.dart';

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
          decoration:
              BoxDecoration(color: CustomColors.cinzaListas, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 0),
            )
          ]),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: GNav(
                  selectedIndex: navIndex,
                  backgroundColor: CustomColors.cinzaListas,
                  rippleColor: const Color.fromARGB(61, 41, 41, 41),
                  color: const Color.fromARGB(255, 51, 51, 51),
                  activeColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  gap: 10,
                  tabBorderRadius: 6,
                  tabs: const [
                    GButton(
                      icon: Icons.people,
                      text: "Clientes",
                      backgroundGradient: LinearGradient(colors: [
                        CustomColors.cor1Clientes,
                        CustomColors.cor2Clientes
                      ]),
                    ),
                    GButton(
                      icon: Icons.flight_takeoff,
                      text: "Viagens",
                      backgroundGradient: LinearGradient(colors: [
                        CustomColors.cor1Viagens,
                        CustomColors.cor2Viagens
                      ]),
                    ),
                    GButton(
                      icon: Icons.analytics,
                      text: "Estatísticas",
                      backgroundGradient: LinearGradient(colors: [
                        CustomColors.cor1Estatisticas,
                        CustomColors.cor2Estatisticas
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
