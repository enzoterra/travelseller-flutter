import 'package:flutter/material.dart';

import '../../custom/styles.dart';

class InformacoesViagemTile extends StatelessWidget {
  const InformacoesViagemTile(
      {super.key,
      required this.hotelController,
      required this.cidadeController});

  final TextEditingController hotelController;
  final TextEditingController cidadeController;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50,
                child: Text(
                  "Dados da Viagem",
                  style: Styles.subTituloCadastro,
                )),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hotel",
                      style: Styles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: largura * 0.7,
                        height: 40,
                        child: TextFormField(
                          controller: hotelController,
                          style: Styles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "Ex. Ocean Palace",
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
                  "Cidade",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: largura * 0.7,
                    height: 40,
                    child: TextFormField(
                      controller: cidadeController,
                      style: Styles.textoAtributoCadastro,
                      decoration: const InputDecoration(
                          hintText: "Ex. Natal/RN",
                          border: UnderlineInputBorder()),
                    ))
              ],
            ),
          ],
        ));
  }
}
