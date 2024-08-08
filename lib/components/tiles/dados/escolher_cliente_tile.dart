import 'package:flutter/material.dart';
import 'package:travelseller/database/model/viagem.dart';
import '../../../pages/listaclientes/listaClientes.dart';
import '../../custom/colors.dart';
import '../../custom/styles.dart';

class EscolherClienteTile extends StatelessWidget {
  const EscolherClienteTile({
    super.key,
    required this.isCadastro,
    required this.viagem,
  });

  final bool isCadastro;
  final Viagem viagem;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 44,
              width: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListaClientes(
                                viagem: viagem,
                                isCadastro: isCadastro,
                              ))));
                },
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(CustomColors.verdeEscuro),
                  shape: CustomStyles.buttonStyle,
                ),
                child: const Text(
                  "Escolher cliente",
                  style: CustomStyles.textoBotoes,
                ),
              )),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
