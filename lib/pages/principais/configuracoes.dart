import 'package:flutter/material.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/dimens.dart';
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
    const double espaco = 20;

    return Scaffold(
      body: Column(children: [
        const TopBarInterno(
          imagem: CustomImages.imagemConfiguracoes,
          titulo: CustomTitles.tituloConfiguracoes,
          index: 1,
        ),
        SizedBox(
            width: largura * CustomDimens.widthListTiles,
            height: altura * 0.72,
            child: Scrollbar(
                child: ListView(children: [
              const SizedBox(
                height: espaco,
              ),

              //Tiles 1
              SizedBox(
                  height: 220,
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
                        iconColor: CustomColors.stateVerdePreto,
                        textColor: CustomColors.stateVerdePreto,
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
                        iconColor: CustomColors.stateVerdePreto,
                        textColor: CustomColors.stateVerdePreto,
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
                  )),
              const Divider(
                thickness: 0.4,
              ),
              const SizedBox(
                height: espaco * 2,
              ),

              //Tiles 2
              SizedBox(
                  height: 220,
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
                          iconColor: CustomColors.stateVerdePreto,
                          textColor: CustomColors.stateVerdePreto,
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
                          iconColor: CustomColors.stateVerdePreto,
                          textColor: CustomColors.stateVerdePreto,
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
                      ])),

              const Divider(
                thickness: 0.4,
              ),
              const SizedBox(
                height: espaco * 2,
              ),

              //Tiles 3
              SizedBox(
                  height: 160,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Exportar e Importar dados",
                          style: CustomStyles.topicoConfiguracoes,
                        ),
                        const SizedBox(
                          height: CustomDimens.spaceFields,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 42,
                              width: 110,
                              child: TextButton(
                                onPressed: exportar(),
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      CustomColors.verdeExportar),
                                ),
                                child: const Text(
                                  "Exportar",
                                  style: CustomStyles.textoBotoesExport,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 42,
                              width: 110,
                              child: TextButton(
                                onPressed: importar(),
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      CustomColors.verdeExportar),
                                ),
                                child: const Text(
                                  "Importar",
                                  style: CustomStyles.textoBotoesExport,
                                ),
                              ),
                            )
                          ],
                        )
                      ])),

              const Divider(
                thickness: 0.4,
              ),
              const SizedBox(
                height: espaco * 2,
              ),

              //Buttons
              SizedBox(
                  height: 40,
                  width: 120,
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
                      backgroundColor:
                          WidgetStatePropertyAll(CustomColors.verdeSalvar),
                    ),
                    child: const Text(
                      "Salvar",
                      style: CustomStyles.textoBotoes,
                    ),
                  )),

              const SizedBox(
                height: espaco,
              ),
            ])))
      ]),
    );
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

  exportar() {}

  importar() {}
}
