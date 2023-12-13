import 'package:flutter/material.dart';
import '../custom/styles.dart';

class CadastroClienteTile extends StatelessWidget {
  const CadastroClienteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50,
                child: Text(
                  "Dados do Cliente",
                  style: Styles.subTituloCadastro,
                )),
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
                        height: 40,
                        child: TextFormField(
                          style: Styles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "Ex. José Almeida da Silva",
                              border: UnderlineInputBorder()),
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CPF",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 140,
                    height: 40,
                    child: TextFormField(
                      style: Styles.textoAtributoCadastro,
                      decoration:
                          const InputDecoration(
                            hintText: "000.000.000-00",
                            border: UnderlineInputBorder()),
                    ))
              ],
            ),
            const SizedBox(height: 0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "RG",
                      style: Styles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 80,
                        height: 40,
                        child: TextFormField(
                          style: Styles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "0000000",
                              border: UnderlineInputBorder()),
                        ))
                  ],
                ),
                SizedBox(
                  width: largura * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nascimento",
                      style: Styles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: TextFormField(
                          style: Styles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "00/00/0000",
                              border: UnderlineInputBorder()),
                        ))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
