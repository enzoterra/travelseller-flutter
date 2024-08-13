import 'package:flutter/material.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/pages/principais/home.dart';

// ignore: must_be_immutable
class SalvarButton extends StatelessWidget {
  SalvarButton({
    super.key,
    required this.functionSave,
    required this.cliente,
    required this.viagem,
    required this.indexHome,
    required this.isCadastro,
    required this.isViagem,
  });

  final Function functionSave;
  final int indexHome;
  var cliente;
  var viagem;
  final bool isCadastro;
  final bool isViagem;

  @override
  Widget build(BuildContext context) {
    bool worked;
    return SizedBox(
        height: CustomDimens.heigthButtons,
        width: 106,
        child: TextButton(
          onPressed: () {
            // Verifica se o salvar está na tela de Cadastro ou de Informações
            if (isCadastro) {
              worked = functionSave();
            } else {
              // Verifica se o Salvar está na tela de Viagem ou de Cliente
              if (isViagem) {
                worked = functionSave(viagem, cliente);
              } else {
                worked = functionSave(cliente);
              }
            }

            if (worked) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Home(
                            currentIndex: indexHome,
                          ))));
            }
          },
          style: ButtonStyle(
            backgroundColor:
                const WidgetStatePropertyAll(CustomColors.verdeSalvar),
            shape: CustomStyles.buttonStyle,
          ),
          child: const Text(
            "Salvar",
            style: CustomStyles.textoBotoes,
          ),
        ));
  }
}
