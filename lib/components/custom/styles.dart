import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';

abstract class CustomStyles {
  static const TextStyle dataViagemTile = TextStyle(fontSize: 12);

  static const TextStyle destinoViagemTile = TextStyle(fontSize: 14);

  static const TextStyle nomeViagemTile =
      TextStyle(fontWeight: FontWeight.bold);

  static const TextStyle tituloPagina = TextStyle(
      shadows: [
        Shadow(
            color: Color.fromARGB(120, 0, 0, 0),
            offset: Offset(0, 0),
            blurRadius: 0)
      ],
      color: CustomColors.brancoTitulos,
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 1);

  static const TextStyle subTituloPagina =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.5);

  static const TextStyle topicoConfiguracoes = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 1.2,
      height: 1.5);

  static const BoxDecoration decorationTile = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: CustomColors.cinzaListas);

  static const TextStyle tituloCadastro = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26,
    letterSpacing: 1.5,
    color: CustomColors.brancoTitulos,
    shadows: [
      Shadow(
          color: Color.fromARGB(120, 0, 0, 0),
          offset: Offset(0, 0),
          blurRadius: 12)
    ],
  );

  static const TextStyle subTituloCadastro = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 1.5,
    color: CustomColors.verdeClaro,
  );

  static const TextStyle tituloAtributoCadastro = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 1.5,
  );

  static const TextStyle textoAtributoCadastro = TextStyle(
    fontSize: 16,
  );

  static const TextStyle textoBotoes = TextStyle(
    color: CustomColors.brancoTextoBotoes,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static const TextStyle cancelarTexto = TextStyle(
    color: CustomColors.brancoTextoBotoes,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    shadows: [
      Shadow(
          color: Color.fromARGB(120, 0, 0, 0),
          offset: Offset(0, 0),
          blurRadius: 2)
    ],
  );

  static const TextStyle textoPretoBotoes = TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2);

  static BoxDecoration boxDecorationListas = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 12,
        offset: const Offset(0, 2),
      ),
    ],
  );
}
