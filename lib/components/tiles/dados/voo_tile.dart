import 'package:flutter/material.dart';

import '../../custom/styles.dart';

class VooTile extends StatelessWidget {
  const VooTile(
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
    const double espaco = 50;
    const double espaco2 = 40;
    const double alturaFields = 60;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const SizedBox(
            height: espaco,
            child: Text(
              "Dados do Voo",
              style: CustomStyles.subTituloCadastro,
            )),
        const SizedBox(
          height: espaco - 20,
        ),
        SizedBox(
            height: alturaFields,
            child: Column(
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
            )),
        const SizedBox(
          height: espaco2,
        ),
        SizedBox(
            height: alturaFields,
            child: Column(
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
            )),
        const SizedBox(
          height: espaco2,
        ),
        SizedBox(
            height: alturaFields,
            child: Column(
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
            )),
        const SizedBox(
          height: espaco,
        ),
        SizedBox(
            height: alturaFields + espaco,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: espaco,
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
            )),
        const SizedBox(height: espaco + 10),
        SizedBox(
            height: alturaFields + espaco,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: espaco,
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
            )),
            const SizedBox(height: 10,),
      ],
    );
  }
}
