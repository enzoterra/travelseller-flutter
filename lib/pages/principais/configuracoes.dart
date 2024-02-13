import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar_interno.dart';
import 'package:travelseller/database/controllers/configuracao_controller.dart';
import 'package:travelseller/database/model/configuracao.dart';
import 'package:travelseller/pages/principais/home.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  ConfiguracoesState createState() => ConfiguracoesState();
}

class ConfiguracoesState extends State<Configuracoes> {
  ConfiguracaoController configuracaoController = ConfiguracaoController();
  List<Configuracao> configuracoes = [];
  int id = 0;
  bool ida = true,
      volta = true,
      umaHora = false,
      umDia = true,
      doisDias = true,
      limpar = false,
      passar = false;

  @override
  void initState() {
    super.initState();
    configuracoes = configuracaoController.readAll();

    if (configuracoes.isEmpty) {
      setState(() {
        Configuracao configuracao = Configuracao(
            ida: true,
            volta: true,
            umaHora: false,
            umDia: true,
            doisDias: true,
            limpar: false,
            passar: false);
        id = configuracaoController.create(configuracao);
        configuracoes = configuracaoController.readAll();
      });
    } else {
      id = configuracoes.first.id;
      ida = configuracoes.first.ida;
      volta = configuracoes.first.volta;
      umaHora = configuracoes.first.umaHora;
      umDia = configuracoes.first.umDia;
      doisDias = configuracoes.first.doisDias;
      limpar = configuracoes.first.limpar;
      passar = configuracoes.first.passar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    const double marginTiles = 40;
    const double espaco = 20;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBarInterno(
                  imagem: CustomImages.imagemConfiguracoes,
                  titulo: CustomTitles.tituloConfiguracoes),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: altura * 0.69,
                    width: largura * 0.9,
                    child: Scrollbar(
                        child: ListView(children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: CustomColors.cinzaConfiguracoes,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Deseja receber lembretes de\nIda e Volta dos clientes?",
                                    style: CustomStyles.topicoConfiguracoes,
                                  ),
                                  const SizedBox(
                                    height: espaco,
                                  ),
                                  ListTile(
                                    selected: ida,
                                    onTap: () {
                                      setState(() {
                                        ida = !ida;
                                      });
                                    },
                                    iconColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    textColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    leading: CustomIcons.configuracaoIda,
                                    title: const Text('Lembrete de Ida'),
                                    trailing: Switch(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          ida = value!;
                                        });
                                      },
                                      value: ida,
                                      activeColor: CustomColors.verdeEscuro,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: espaco,
                                  ),
                                  ListTile(
                                    selected: volta,
                                    onTap: () {
                                      setState(() {
                                        volta = !volta;
                                      });
                                    },
                                    iconColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    textColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    leading: CustomIcons.configuracaoVolta,
                                    title: const Text('Lembrete de Volta'),
                                    trailing: Switch(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          volta = value!;
                                        });
                                      },
                                      value: volta,
                                      activeColor: CustomColors.verdeEscuro,
                                    ),
                                  ),
                                ],
                              ))),
                      const SizedBox(
                        height: marginTiles,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              color: CustomColors.cinzaConfiguracoes,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Com quanto tempo de antecedência deseja receber os lembretes?",
                                    style: CustomStyles.topicoConfiguracoes,
                                  ),
                                  const SizedBox(
                                    height: espaco,
                                  ),
                                  ListTile(
                                    selected: umDia,
                                    onTap: () {
                                      setState(() {
                                        umDia = !umDia;
                                      });
                                    },
                                    iconColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    textColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    leading: CustomIcons.configuracaoUmDia,
                                    title: const Text('1 dia antes'),
                                    trailing: Switch(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          umDia = value!;
                                        });
                                      },
                                      value: umDia,
                                      activeColor: CustomColors.verdeEscuro,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: espaco,
                                  ),
                                  ListTile(
                                    selected: doisDias,
                                    onTap: () {
                                      setState(() {
                                        doisDias = !doisDias;
                                      });
                                    },
                                    iconColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    textColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return CustomColors.verdeEscuro;
                                      }
                                      return CustomColors.pretoIcones;
                                    }),
                                    leading: CustomIcons.configuracaoDoisDias,
                                    title: const Text('2 dias antes'),
                                    trailing: Switch(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          doisDias = value!;
                                        });
                                      },
                                      value: doisDias,
                                      activeColor: CustomColors.verdeEscuro,
                                    ),
                                  ),
                                ],
                              ))),
                      const SizedBox(
                        height: marginTiles,
                      ),
                    ]))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 70,
                  width: largura * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 106,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Home(
                                            currentIndex: 1,
                                          ))));
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColors.cinzaCancelar),
                            ),
                            child: const Text(
                              "Cancelar",
                              style: CustomStyles.cancelarTexto,
                            ),
                          )),
                      SizedBox(
                          height: 40,
                          width: 106,
                          child: TextButton(
                            onPressed: () {
                              salvar(id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Home(
                                            currentIndex: 1,
                                          ))));
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColors.verdeSalvar),
                            ),
                            child: const Text(
                              "Salvar",
                              style: CustomStyles.textoBotoes,
                            ),
                          ))
                    ],
                  ))
            ]));
  }

  salvar(int id) {
    Configuracao configuracao = Configuracao(
        ida: ida,
        volta: volta,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);
    configuracao.id = id;
    configuracaoController.update(configuracao);
  }
}
