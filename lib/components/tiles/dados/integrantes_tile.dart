import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';

import '../../custom/styles.dart';

class InformacoesSalvasTile extends StatelessWidget {
  const InformacoesSalvasTile(
      {super.key,
      required this.valorVendaController,
      required this.comissaoController,
      required this.observacoesController});

  final TextEditingController valorVendaController;
  final TextEditingController comissaoController;
  final TextEditingController observacoesController;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50,
                child: Text(
                  "Outras informações",
                  style: CustomStyles.subTituloCadastro,
                )),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Valor da Venda",
                      style: CustomStyles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: TextFormField(
                          controller: valorVendaController,
                          keyboardType: TextInputType.number,
                          style: CustomStyles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "Ex. 5000",
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
                      "Comissão",
                      style: CustomStyles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: TextFormField(
                          controller: comissaoController,
                          keyboardType: TextInputType.number,
                          style: CustomStyles.textoAtributoCadastro,
                          decoration: const InputDecoration(
                              hintText: "Ex. 300",
                              border: UnderlineInputBorder()),
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Observações",
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: largura * 1,
                    height: 120,
                    child: TextField(
                      controller: observacoesController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      style: CustomStyles.textoAtributoCadastro,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ))
              ],
            ),
            const SizedBox(height: 0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 40,
                  width: 140,
                  child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              CustomColors.verdeEscuro)),
                      child: const Text(
                        "Integrantes",
                        style: CustomStyles.textoBotoes,
                      )))
            ]),
            const SizedBox(height: 0),
          ],
        ));
  }
}
