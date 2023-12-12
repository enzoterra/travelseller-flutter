import 'package:flutter/material.dart';
import '../custom/styles.dart';

class CadastroClienteTile extends StatelessWidget {
  const CadastroClienteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: altura * 0.4,
        width: largura * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 1,
                    child: Column(
                      children: [
                        const Text(
                          "Nome",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
                height: altura * 0.3,
                width: largura * 1,
                child: Row(
                  children: [
                    const Text(
                      "CPF",
                      style: Styles.subTituloCadastro,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    )
                  ],
                )),
            Row(
              children: [
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 0.4,
                    child: Column(
                      children: [
                        const Text(
                          "RG",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    )),
                SizedBox(
                    height: altura * 0.3,
                    width: largura * 0.4,
                    child: Column(
                      children: [
                        const Text(
                          "Data de Nascimento",
                          style: Styles.subTituloCadastro,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()),
                        )
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}
