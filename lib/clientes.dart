import 'package:flutter/material.dart';
import 'bottomNavigation.dart';
import 'topBar.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  static const String titulo = "Clientes Cadastrados";
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
      bottomNavigationBar: BottomNavigation(indexPag: 0),
    );
  }
}
