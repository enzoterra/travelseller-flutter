import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/pages/principais/home.dart';

// ignore: must_be_immutable
class ExcluirButton extends StatelessWidget {
  ExcluirButton(
      {super.key,
      required this.functionDelete,
      required this.cliente,
      required this.viagem,
      required this.indexHome,
      required this.isViagem});

  final Function functionDelete;
  final int indexHome;
  var cliente;
  var viagem;
  final bool isViagem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: CustomDimens.heigthButtons,
        width: 106,
        child: TextButton(
          onPressed: () {
            // Excluir para Viagem
            if (isViagem) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja excluir?'),
                  content: const Text(
                      'Isso excluirá os dados da viagem, mas manterá os dados do cliente'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        functionDelete(viagem);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Home(
                                      currentIndex: indexHome,
                                    ))));
                      },
                      child: const Text('Excluir'),
                    ),
                  ],
                ),
              );
            } 
            //Excluir para Cliente
            else {
              //ALTERAR PARA VERIFICAR SE EXISTE VIAGEM DO CLIENTE AINDA PARA SER REALIZADA
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja excluir?'),
                  content: const Text(
                      'Isso excluirá os dados do cliente, mas manterá os dados de alguma viagem cadastrada no nome dele'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        functionDelete(cliente);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Home(
                                      currentIndex: indexHome,
                                    ))));
                      },
                      child: const Text('Excluir'),
                    ),
                  ],
                ),
              );
            }
          },
          style: ButtonStyle(
            backgroundColor:
                const WidgetStatePropertyAll(CustomColors.vermelhoExcluir),
            shape: CustomStyles.buttonStyle,
          ),
          child: const Text(
            "Excluir",
            style: CustomStyles.textoBotoes,
          ),
        ));
  }
}
