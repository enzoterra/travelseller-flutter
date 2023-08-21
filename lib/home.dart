import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class TopBar extends StatelessWidget{
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/viagens_topbar.jpg'),
                  fit: BoxFit.fill
                )
              )
            ),
            title: Text("Viagens Programadas"),
          )
        )
    );
  }

}

class BottomNavigation extends StatelessWidget{
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: const [
        BottomNavigationBarItem(label: "Clientes", icon: Icon(Icons.people)),
        BottomNavigationBarItem(label: "Viagens", icon: Icon(Icons.flight_takeoff)),
        BottomNavigationBarItem(label: "Estatísticas", icon: Icon(Icons.calendar_today))
      ])
    );
  }

}
