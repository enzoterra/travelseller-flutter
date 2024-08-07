import 'dart:io';

import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelseller/components/custom/colors.dart';
import 'package:travelseller/components/custom/dimens.dart';
import 'package:travelseller/components/custom/icons.dart';
import 'package:travelseller/components/custom/images.dart';
import 'package:travelseller/components/custom/styles.dart';
import 'package:travelseller/components/custom/titles.dart';
import 'package:travelseller/components/top_bar_interno.dart';
import 'package:travelseller/database/controllers/cliente_controller.dart';
import 'package:travelseller/database/controllers/configuracao_controller.dart';
import 'package:travelseller/database/controllers/viagem_controller.dart';
import 'package:travelseller/database/model/cliente.dart';
import 'package:travelseller/database/model/configuracao.dart';
import 'package:travelseller/database/model/viagem.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  ConfiguracoesState createState() => ConfiguracoesState();
}

class ConfiguracoesState extends State<Configuracoes> {
  ConfiguracaoController configuracaoController = ConfiguracaoController();
  List<Configuracao> configuracoes = [];
  int id = 0;
  late bool ida, volta, umaHora, umDia, doisDias, limpar, passar;

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
  void dispose() {
    super.dispose();
    // Função que executa quando sair da página
    salvar(id);
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
            height: altura * 0.75,
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

              //Tiles Export
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
                              height: CustomDimens.heigthButtons,
                              width: 110,
                              child: TextButton(
                                onPressed: () {
                                  exportar();
                                  SnackBar snackBar;
                                  try {
                                    exportar();
                                    snackBar = const SnackBar(
                                        content: Text('Dados exportados!'));
                                  } catch (error) {
                                    snackBar = SnackBar(
                                        content: Text(
                                            "Erro na exportação - $error"));
                                  }
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                      CustomColors.verdeExportar),
                                  shape: CustomStyles.buttonStyle,
                                ),
                                child: const Text(
                                  "Exportar",
                                  style: CustomStyles.textoBotoesExport,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: CustomDimens.heigthButtons,
                              width: 110,
                              child: TextButton(
                                onPressed: importar(),
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                      CustomColors.verdeExportar),
                                  shape: CustomStyles.buttonStyle,
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

  Future<String> getDir() {
    Future<String> dir = ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS);
    return dir;
  }

  exportar() {
    getDir().then((dir) async {
      dir = "$dir/TravelSeller";
      final folderPath = Directory(dir);
      if (await folderPath.exists() == false) {
        await folderPath.create(recursive: true);
      }
      exportarViagens(dir);
      exportarClientes(dir);
      exportarConfiguracoes(dir);
    });
  }

  importar() {
    getDir().then((dir) async {
      dir = "$dir/TravelSeller";
      
      final dataViagens = await rootBundle.loadString('$dir/viagens.csv');
      List<List<dynamic>> csvViagens = const CsvToListConverter().convert(dataViagens);

      final dataClientes = await rootBundle.loadString('$dir/clientes.csv');
      List<List<dynamic>> csvClientes = const CsvToListConverter().convert(dataClientes);

      final dataConfiguracao = await rootBundle.loadString('$dir/configuracao.csv');
      List<List<dynamic>> csvConfiguracao = const CsvToListConverter().convert(dataConfiguracao);
    });
  }

  exportarViagens(String dir) {
    List<Viagem> viagens = ViagemController().readAll();
    List<List<dynamic>> lista = [];
    for (Viagem v in viagens) {
      lista.add([
        v.id,
        v.codigoVenda,
        v.localizador,
        v.companhiaAerea,
        v.cidade,
        v.hotel,
        v.dataIda,
        v.horaIda,
        v.dataVolta,
        v.horaVolta,
        v.observacoes,
        v.valorTotal,
        v.valorComissao,
        v.idCliente
      ]);
    }
    String csv = const ListToCsvConverter().convert(lista);
    File file = File("$dir/viagens.csv");
    file.writeAsString(csv);
  }

  exportarClientes(String dir) {
    List<Cliente> clientes = ClienteController().readAll();
    List<List<dynamic>> lista = [];
    for (Cliente c in clientes) {
      lista.add([
        c.id,
        c.nome,
        c.cpf,
        c.rg,
        c.dataNascimento,
      ]);
    }
    String csv = const ListToCsvConverter().convert(lista);
    File file = File("$dir/clientes.csv");
    file.writeAsString(csv);
  }

  exportarConfiguracoes(String dir) {
    List<Configuracao> configuracao = ConfiguracaoController().readAll();
    List<List<dynamic>> lista = [];
    for (Configuracao c in configuracao) {
      lista.add([
        c.id,
        c.ida,
        c.volta,
        c.umaHora,
        c.umDia,
        c.doisDias,
        c.limpar,
        c.passar,
      ]);
    }
    String csv = const ListToCsvConverter().convert(lista);
    File file = File("$dir/configuracao.csv");
    file.writeAsString(csv);
  }
}
