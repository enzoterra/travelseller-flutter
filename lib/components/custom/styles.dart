import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle dataViagemTile = TextStyle(fontSize: 10);

  static const TextStyle destinoViagemTile = TextStyle(fontSize: 12);

  static const TextStyle nomeViagemTile =
      TextStyle(fontWeight: FontWeight.bold);

  static const TextStyle tituloPagina = TextStyle(
      shadows: [
        Shadow(
            color: Color.fromARGB(120, 0, 0, 0),
            offset: Offset(0, 0),
            blurRadius: 0)
      ],
      color: Colors.white,
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 1);

  static const TextStyle subTituloPagina =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.5);

  static const BoxDecoration decorationTile = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color.fromARGB(255, 233, 233, 233));
}
