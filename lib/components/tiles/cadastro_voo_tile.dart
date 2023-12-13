import 'package:flutter/material.dart';

import '../custom/styles.dart';

class CadastroVooTile extends StatelessWidget {
  const CadastroVooTile({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50,
                child: Text(
                  "Dados do Voo",
                  style: Styles.subTituloCadastro,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Localizador",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 80,
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: Styles.textoAtributoCadastro,
                      decoration: const InputDecoration(
                          hintText: "Ex. 000000",
                          border: UnderlineInputBorder()),
                    ))
              ],
            ),
            const SizedBox(height: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Código da venda",
                  style: Styles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 120,
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: Styles.textoAtributoCadastro,
                      decoration: const InputDecoration(
                          hintText: "Ex. 000000000",
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
                    const SizedBox(
                        height: 50,
                        child: Text(
                          "Ida",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3),
                        )),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Data",
                              style: Styles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 100,
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Styles.textoAtributoCadastro,
                                  decoration: const InputDecoration(
                                      hintText: "00/00/0000",
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
                              "Horário",
                              style: Styles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 60,
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Styles.textoAtributoCadastro,
                                  decoration: const InputDecoration(
                                      hintText: "00:00",
                                      border: UnderlineInputBorder()),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 50,
                        child: Text(
                          "Volta",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3),
                        )),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Data",
                              style: Styles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 100,
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Styles.textoAtributoCadastro,
                                  decoration: const InputDecoration(
                                      hintText: "00/00/0000",
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
                              "Horário",
                              style: Styles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 60,
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  style: Styles.textoAtributoCadastro,
                                  decoration: const InputDecoration(
                                      hintText: "00:00",
                                      border: UnderlineInputBorder()),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
