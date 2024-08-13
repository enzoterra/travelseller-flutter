import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelseller/custom/dimens.dart';

import '../../../custom/styles.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
            height: CustomDimens.spaceFields,
            child: Text(
              "Outras informações",
              style: CustomStyles.subTituloCadastro,
            )),
        const SizedBox(
          height: CustomDimens.spaceFields - 20,
        ),
        SizedBox(
            height: CustomDimens.heightFields,
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter()
                          ],
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter()
                          ],
                        ))
                  ],
                ),
              ],
            )),
        const SizedBox(height: CustomDimens.spaceFields),
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
            const SizedBox(height: CustomDimens.spaceFields),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
