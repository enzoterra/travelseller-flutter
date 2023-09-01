import 'package:flutter/material.dart';
import 'package:travelseller/clientes.dart';
import 'package:travelseller/estatisticas.dart';
import 'bottomNavigation.dart';
import 'topBar.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

class ViagensState extends State<Viagens> {
  static const String titulo = "Viagens Programadas";
  static const String imagem = "assets/images/viagens_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: TopBar(
            imagem: imagem,
            titulo: titulo,
          )),
      bottomNavigationBar: BottomNavigation(
        indexPag: 1,
      ),
    );
  }
}
