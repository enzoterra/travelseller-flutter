import 'package:flutter/material.dart';
import 'package:travelseller/consts/topBar.dart';

class Viagens extends StatefulWidget {
  const Viagens({super.key});

  @override
  ViagensState createState() => ViagensState();
}

class ViagensState extends State<Viagens> {
  static const String titulo = "Viagens\nProgramadas";
  static const String imagem = "assets/images/viagens_topbar.jpg";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopBar(
            imagem: imagem,
            titulo: titulo,
          ),
      //bottomNavigationBar: BottomNavigation(indexPag: 1,),
    );
  }
}

//bottomNavigationBar: BottomNavigation(indexPag: 1,),
/*
  appBar: PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: TopBar(
      imagem: imagem,
      titulo: titulo,
  )),
*/