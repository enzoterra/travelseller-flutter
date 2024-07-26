import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/styles.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.imagem, required this.titulo});

  final String imagem;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return SizedBox(
      height: altura * CustomDimens.heightTopImages,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
                  image: AssetImage(imagem),
                  fit: BoxFit.cover)),
          child: Column(children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
            flex: 7,
            child: Container(alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(titulo, style: CustomStyles.tituloPagina))),
          ])));
  }
}
