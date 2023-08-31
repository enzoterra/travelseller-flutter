import 'package:flutter/material.dart';
import 'bottomNavigation.dart';
import 'topBar.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  EstatisticasState createState() => EstatisticasState();
}

class EstatisticasState extends State<Estatisticas> {
  static const String titulo = "Estatísticas";
  static const String imagem = "assets/images/viagens_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(120.0), child: TopBar(imagem: imagem, titulo: titulo,)),
      bottomNavigationBar: BottomNavigation(index: 0),
    );
  }
}