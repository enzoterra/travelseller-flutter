import 'package:flutter/material.dart';
import 'package:travelseller/components/buttons/cancelar.dart';
import 'package:travelseller/components/buttons/excluir.dart';
import 'package:travelseller/components/buttons/salvar.dart';
import 'package:travelseller/custom/dimens.dart';

// ignore: must_be_immutable
class ActionButtonsCadastro extends StatelessWidget {
  ActionButtonsCadastro(
      {super.key,
      required this.functionSave,
      required this.functionDelete,
      required this.indexHome,
      required this.isCadastro,
      required this.isViagem,
      required this.viagem,
      required this.cliente});

  final Function functionSave;
  final Function functionDelete;
  final int indexHome;
  final bool isCadastro;
  final bool isViagem;
  var viagem;
  var cliente;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    //Verifica se a página de origem é de Cadastro ou Informações
    if (isCadastro) {
      return SizedBox(
          height: CustomDimens.marginTiles,
          width: largura * 0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CancelarButton(),
              SalvarButton(
                functionSave: functionSave,
                cliente: cliente,
                viagem: viagem,
                indexHome: indexHome,
                isCadastro: isCadastro,
                isViagem: isViagem,
              ),
            ],
          ));
    } else {
      return SizedBox(
          height: CustomDimens.marginTiles,
          width: largura * 0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ExcluirButton(
                  functionDelete: functionDelete,
                  cliente: cliente,
                  viagem: viagem,
                  indexHome: indexHome,
                  isViagem: isViagem),
              SalvarButton(
                  functionSave: functionSave,
                  cliente: cliente,
                  viagem: viagem,
                  isCadastro: isCadastro,
                  isViagem: isViagem,
                  indexHome: indexHome),
            ],
          ));
    }
  }
}
