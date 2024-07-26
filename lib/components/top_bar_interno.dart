import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/styles.dart';

class TopBarInterno extends StatelessWidget {
  const TopBarInterno({super.key, required this.imagem, required this.titulo});

  final String imagem;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura * CustomDimens.heightTopImagesTiles,
      width: largura * 1,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                  Color.fromARGB(50, 0, 0, 0), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(imagem))),
      child: Column(children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
            flex: 5,
            child: Center(
                child: Text(
              titulo,
              style: CustomStyles.tituloCadastro,
            )))
      ]),
    );
  }
}
