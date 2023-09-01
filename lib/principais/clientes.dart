import 'package:flutter/material.dart';
import 'package:travelseller/consts/topBar.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  ClientesState createState() => ClientesState();
}

class ClientesState extends State<Clientes> {
  static const String titulo = "Clientes\nCadastrados";
  static const String imagem = "assets/images/clientes_topbar.jpg";

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
