import 'package:flutter/material.dart';

import '../custom/styles.dart';

class CadastroInformacoesTile extends StatelessWidget {
  const CadastroInformacoesTile({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50,
                child: Text(
                  "Outras informações",
                  style: Styles.subTituloCadastro,
                )),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Valor da Venda",
                      style: Styles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Styles.textoAtributoCadastro,
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
                      style: Styles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Styles.textoAtributoCadastro,
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
                  style: Styles.tituloAtributoCadastro,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: largura * 1,
                    height: 120,
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      style: Styles.textoAtributoCadastro,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ))
              ],
            ),
          ],
        ));
  }
}
