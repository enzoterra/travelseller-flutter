import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/styles.dart';

class TopBar extends StatelessWidget {
  final String imagem;
  final String titulo;

  const TopBar({super.key, required this.imagem, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return SizedBox(
      height: altura * 0.18,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
                  image: AssetImage(imagem),
                  fit: BoxFit.cover)),
          child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(titulo, style: CustomStyles.tituloPagina))),
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