import 'package:flutter/material.dart';

import '../../custom/styles.dart';

class InformacoesVooTile extends StatelessWidget {
  const InformacoesVooTile(
      {super.key,
      required this.localizadorController,
      required this.codigoController,
      required this.dataIdaController,
      required this.horaIdaController,
      required this.dataVoltaController,
      required this.horaVoltaController,
      required this.companhiaController});

  final TextEditingController localizadorController;
  final TextEditingController companhiaController;
  final TextEditingController codigoController;
  final TextEditingController dataIdaController;
  final TextEditingController horaIdaController;
  final TextEditingController dataVoltaController;
  final TextEditingController horaVoltaController;

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
                  style: CustomStyles.subTituloCadastro,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Localizador",
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 80,
                    height: 40,
                    child: TextFormField(
                      controller: localizadorController,
                      keyboardType: TextInputType.number,
                      style: CustomStyles.textoAtributoCadastro,
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
                  "Companhia Aérea",
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      controller: companhiaController,
                      keyboardType: TextInputType.text,
                      style: CustomStyles.textoAtributoCadastro,
                      decoration: const InputDecoration(
                          hintText: "Ex. Latam",
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
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 120,
                    height: 40,
                    child: TextFormField(
                      controller: codigoController,
                      keyboardType: TextInputType.number,
                      style: CustomStyles.textoAtributoCadastro,
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
                              style: CustomStyles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 100,
                                height: 40,
                                child: TextFormField(
                                  controller: dataIdaController,
                                  keyboardType: TextInputType.datetime,
                                  style: CustomStyles.textoAtributoCadastro,
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
                              style: CustomStyles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 60,
                                height: 40,
                                child: TextFormField(
                                  controller: horaIdaController,
                                  keyboardType: TextInputType.datetime,
                                  style: CustomStyles.textoAtributoCadastro,
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
                              style: CustomStyles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 100,
                                height: 40,
                                child: TextFormField(
                                  controller: dataVoltaController,
                                  keyboardType: TextInputType.datetime,
                                  style: CustomStyles.textoAtributoCadastro,
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
                              style: CustomStyles.tituloAtributoCadastro,
                            ),
                            SizedBox(
                                width: 60,
                                height: 40,
                                child: TextFormField(
                                  controller: horaVoltaController,
                                  keyboardType: TextInputType.datetime,
                                  style: CustomStyles.textoAtributoCadastro,
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
