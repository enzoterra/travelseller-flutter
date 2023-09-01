import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String imagem;
  final String titulo;

  const TopBar({Key? key, required this.imagem, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagem), fit: BoxFit.cover))),
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      elevation: 0,
    );
  }
}
