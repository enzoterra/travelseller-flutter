import 'package:flutter/material.dart';

import '../../custom/styles.dart';

class ViagemTile extends StatelessWidget {
  const ViagemTile(
      {super.key,
      required this.hotelController,
      required this.cidadeController});

  final TextEditingController hotelController;
  final TextEditingController cidadeController;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    const double espaco = 50;
    const double alturaFields = 60;

    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const SizedBox(
                height: espaco,
                child: Text(
                  "Dados da Viagem",
                  style: CustomStyles.subTituloCadastro,
                )),
                const SizedBox(
                  height: espaco - 20,
                ),
            Row(
              children: [
                SizedBox(
                    height: alturaFields,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hotel",
                          style: CustomStyles.tituloAtributoCadastro,
                        ),
                        SizedBox(
                            width: largura * 0.7,
                            height: 40,
                            child: TextFormField(
                              controller: hotelController,
                              style: CustomStyles.textoAtributoCadastro,
                              decoration: const InputDecoration(
                                  hintText: "Ex. Ocean Palace",
                                  border: UnderlineInputBorder()),
                            ))
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: espaco,
            ),
            SizedBox(
                height: alturaFields,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cidade",
                      style: CustomStyles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: largura * 0.7,
                        height: 40,
                        child: TextFormField(
                          controller: cidadeController,
                          style: CustomStyles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "Ex. Natal/RN",
                              border: UnderlineInputBorder()),
                        ))
                  ],
                )),
                const SizedBox(height: 10,),
          ],
        );
  }
}
