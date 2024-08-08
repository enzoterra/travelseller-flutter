import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/pages/principais/home.dart';

class InternTopbar extends StatelessWidget {
  const InternTopbar(
      {super.key,
      required this.imagem,
      required this.titulo,
      required this.index});

  final String imagem;
  final String titulo;
  final int index;

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
        SizedBox(
          height: 75,
          width: largura * 0.97,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Home(
                                  currentIndex: index,
                                ))));
                  },
                  icon: CustomIcons.iconBack,
                  color: Colors.white,
                ),
              ]),
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
            child: Text(
          titulo,
          style: CustomStyles.tituloCadastro,
        ))
      ]),
    );
  }
}
