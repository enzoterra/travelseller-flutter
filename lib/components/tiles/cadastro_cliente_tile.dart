import 'package:flutter/material.dart';
import '../custom/styles.dart';

class CadastroClienteTile extends StatelessWidget {
  const CadastroClienteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dados do Cliente",
          style: Styles.subTituloCadastro,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nome",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: largura * 0.7,
                    height: 30,
                    child: TextFormField(
                      style: Styles.textoAtributoCadastro,
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    ))
              ],
            )
          ],
        ),
        Row(
          children: [
            const Text(
              "CPF",
              style: Styles.tituloAtributoCadastro,
            ),
            SizedBox(
                width: largura * 0.5,
                height: 30,
                child: TextFormField(
                  style: Styles.textoAtributoCadastro,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "RG",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: largura * 0.3,
                    height: 30,
                    child: TextFormField(
                      style: Styles.textoAtributoCadastro,
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data de Nascimento",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: largura * 0.3,
                    height: 30,
                    child: TextFormField(
                      style: Styles.textoAtributoCadastro,
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    ))
              ],
            )
          ],
        ),
      ],
    ));
  }
}
