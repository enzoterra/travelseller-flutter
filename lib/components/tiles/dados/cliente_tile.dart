import 'package:flutter/material.dart';
import '../../custom/styles.dart';

class ClienteTile extends StatelessWidget {
  const ClienteTile({
    super.key,
    required this.nomeController,
    required this.cpfController,
    required this.rgController,
    required this.nascimentoController,
  });

  final TextEditingController nomeController;
  final TextEditingController cpfController;
  final TextEditingController rgController;
  final TextEditingController nascimentoController;

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
                  style: CustomStyles.subTituloCadastro,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nome",
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: largura * 0.7,
                    height: 40,
                    child: TextFormField(
                      controller: nomeController,
                      style: CustomStyles.textoAtributoCadastro,
                      decoration: const InputDecoration(
                          hintText: "Ex. José Almeida da Silva",
                          border: UnderlineInputBorder()),
                    ))
              ],
            ),
            const SizedBox(height: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CPF",
                  style: CustomStyles.tituloAtributoCadastro,
                ),
                SizedBox(
                    width: 140,
                    height: 40,
                    child: TextFormField(
                      controller: cpfController,
                      keyboardType: TextInputType.number,
                      style: CustomStyles.textoAtributoCadastro,
                      decoration: const InputDecoration(
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
                      style: CustomStyles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 80,
                        height: 40,
                        child: TextFormField(
                          controller: rgController,
                          keyboardType: TextInputType.number,
                          style: CustomStyles.textoAtributoCadastro,
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
                      style: CustomStyles.tituloAtributoCadastro,
                    ),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: TextFormField(
                          controller: nascimentoController,
                          keyboardType: TextInputType.datetime,
                          style: CustomStyles.textoAtributoCadastro,
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
