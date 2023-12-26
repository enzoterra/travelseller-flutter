import 'package:flutter/material.dart';

abstract class CustomIcons {
  static const AssetImage iconeViagemTile =
      AssetImage('assets/icons/plane.png');

  static const Icon iconeClienteTile = Icon(
    Icons.person,
    color: Colors.black87,
  );

  static const Icon iconeConfiguracao = Icon(
    Icons.settings,
    color: Colors.black87,
  );

  static const Icon iconeVoltar = Icon(
    Icons.arrow_back_ios_rounded,
    color: Colors.black87,
  );

  static const Icon configuracaoIda = Icon(
    Icons.today,
  );

  static const Icon configuracaoVolta = Icon(
    Icons.event,
  );

  static const Icon configuracaoUmDia = Icon(
    Icons.alarm_on,
  );

  static const Icon configuracaoDoisDias = Icon(
    Icons.alarm_on,
  );
}
