import 'package:flutter/material.dart';

abstract class CustomColors {
  static const Color brancoTitulos = Colors.white;

  static const Color brancoTextoBotoes = Colors.white;

  static const Color pretoTextoBotoes = Colors.black87;

  static const Color pretoIcones = Colors.black87;

  static const Color cinzaListas = Color.fromARGB(255, 254, 247, 255);

  static const Color cinzaTileViagens = cinzaListas;

  static const Color cinzaConfiguracoes = Color.fromARGB(255, 244, 244, 244);

  static const Color cinzaBottomNavigation = Color.fromARGB(255, 245, 245, 245);

  static const Color verdeClaro = Color.fromARGB(255, 24, 134, 108);

  static const Color verdeEscuro = Color.fromARGB(255, 13, 97, 78);

  static const Color azulBotaoViagens = Color.fromARGB(255, 1, 50, 124);

  static const Color verdeSalvar = Color.fromARGB(255, 56, 129, 58);

  static const Color verdeExportar = Color.fromARGB(255, 45, 117, 90);

  static const Color vermelhoExcluir = Colors.red;

  static const Color cinzaCancelar = Color.fromARGB(255, 145, 145, 145);

  //Gradientes Bottom Navigation
  static const Color cor1Clientes = Color.fromRGBO(50, 153, 172, 1);
  static const Color cor2Clientes = Color.fromRGBO(35, 168, 103, 1);

  static const Color cor1Viagens = Color.fromRGBO(2, 52, 139, 1);
  static const Color cor2Viagens = Color.fromRGBO(91, 5, 128, 1);

  static const Color cor1Estatisticas = Color.fromRGBO(2, 52, 139, 1);
  static const Color cor2Estatisticas = Color.fromRGBO(207, 178, 9, 1);

  //State Configuracoes
  static Color stateVerdePreto =
      WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return CustomColors.verdeEscuro;
    }
    return CustomColors.pretoIcones;
  });
}
