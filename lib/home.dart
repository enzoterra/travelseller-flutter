import 'package:flutter/material.dart';
import 'bottomNavigation.dart';
import 'topBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static const String titulo = "Viagens Programadas";
  static const String imagem = "assets/images/viagens_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(120.0), child: TopBar(imagem: imagem, titulo: titulo,)),
      bottomNavigationBar: BottomNavigation(index: 1),
    );
  }
}