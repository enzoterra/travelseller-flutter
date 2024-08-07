import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/styles.dart';
import '../../pages/principais/home.dart';

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
    double heightRow = 70;
    double heightButtons = 40;

    //Verifica se a página de origem é de Cadastro ou Informações
    if (isCadastro) {
      return SizedBox(
          height: heightRow,
          width: largura * 0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: heightButtons,
                  width: 110,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home(
                                    currentIndex: indexHome,
                                  ))));
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                          CustomColors.cinzaCancelar),
                      shape: CustomStyles.buttonStyle,
                    ),
                    child: const Text(
                      "Cancelar",
                      style: CustomStyles.cancelarTexto,
                    ),
                  )),
              SizedBox(
                  height: heightButtons,
                  width: 106,
                  child: TextButton(
                    onPressed: () {
                      functionSave();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home(
                                    currentIndex: indexHome,
                                  ))));
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                          CustomColors.verdeSalvar),
                      shape: CustomStyles.buttonStyle,
                    ),
                    child: const Text(
                      "Salvar",
                      style: CustomStyles.textoBotoes,
                    ),
                  ))
            ],
          ));
    } else {
      //Verifica se a página de informações é de Viagem ou Cliente
      if (isViagem) {
        return SizedBox(
            height: heightRow,
            width: largura * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: heightButtons,
                    width: 106,
                    child: TextButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Deseja excluir?'),
                            content: const Text(
                                'Isso excluirá os dados da viagem, mas manterá os dados do cliente'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
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
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            CustomColors.vermelhoExcluir),
                        shape: CustomStyles.buttonStyle,
                      ),
                      child: const Text(
                        "Excluir",
                        style: CustomStyles.textoBotoes,
                      ),
                    )),
                SizedBox(
                    height: heightButtons,
                    width: 106,
                    child: TextButton(
                      onPressed: () {
                        functionSave(viagem, cliente);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Home(
                                      currentIndex: indexHome,
                                    ))));
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            CustomColors.verdeSalvar),
                        shape: CustomStyles.buttonStyle,
                      ),
                      child: const Text(
                        "Salvar",
                        style: CustomStyles.textoBotoes,
                      ),
                    ))
              ],
            ));
      } else {
        return SizedBox(
            height: heightRow,
            width: largura * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: heightButtons,
                    width: 106,
                    child: TextButton(
                      onPressed: () {
                        //ALTERAR PARA VERIFICAR SE EXISTE VIAGEM DO CLIENTE AINDA PARA SER REALIZADA
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Deseja excluir?'),
                            content: const Text(
                                'Isso excluirá os dados do cliente, mas manterá os dados de alguma viagem que estava cadastrado'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  functionDelete(cliente);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => const Home(
                                                currentIndex: 1,
                                              ))));
                                },
                                child: const Text('Excluir'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            CustomColors.vermelhoExcluir),
                        shape: CustomStyles.buttonStyle,
                      ),
                      child: const Text(
                        "Excluir",
                        style: CustomStyles.textoBotoes,
                      ),
                    )),
                SizedBox(
                    height: heightButtons,
                    width: 106,
                    child: TextButton(
                      onPressed: () {
                        functionSave(cliente);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Home(
                                      currentIndex: 1,
                                    ))));
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            CustomColors.verdeSalvar),
                        shape: CustomStyles.buttonStyle,
                      ),
                      child: const Text(
                        "Salvar",
                        style: CustomStyles.textoBotoes,
                      ),
                    ))
              ],
            ));
      }
    }
  }
}
