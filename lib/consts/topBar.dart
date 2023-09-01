import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String imagem;
  final String titulo;

  const TopBar({Key? key, required this.imagem, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagem), fit: BoxFit.cover)),
          child: Container(
            alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(titulo,
                  style: const TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1)))),
    );
  }
}

/*
return AppBar(
      flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagem), fit: BoxFit.cover))),
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      elevation: 0,
    );
*/