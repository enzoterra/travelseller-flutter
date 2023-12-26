import 'package:flutter/material.dart';

import '../../custom/styles.dart';

class OutrasInformacoesTile extends StatelessWidget {
  const OutrasInformacoesTile(
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
    const double espaco = 50;
    const double alturaFields = 60;

    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const SizedBox(
                height: espaco,
                child: Text(
                  "Outras informações",
                  style: CustomStyles.subTituloCadastro,
                )),
             const SizedBox(
              height: espaco - 20,
            ),
            SizedBox(
                height: alturaFields,
                child: Row(
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
            )),
            const SizedBox(height: espaco),
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
                    )),
                    const SizedBox(height: espaco),
              ],
            ),
            const SizedBox(height: 10,),
          ],
        );
  }
}
