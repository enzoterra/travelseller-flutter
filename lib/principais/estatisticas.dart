import 'package:flutter/material.dart';
import 'package:travelseller/consts/topBar.dart';

class Estatisticas extends StatefulWidget {
  const Estatisticas({super.key});

  @override
  EstatisticasState createState() => EstatisticasState();
}

class EstatisticasState extends State<Estatisticas> {
  static const String titulo = "Estatísticas";
  static const String imagem = "assets/images/estatisticas_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopBar(
            imagem: imagem,
            titulo: titulo,
          ),
    );
  }
}
