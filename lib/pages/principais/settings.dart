import 'package:flutter/material.dart';
import 'package:travelseller/custom/colors.dart';
import 'package:travelseller/custom/dimens.dart';
import 'package:travelseller/custom/icons.dart';
import 'package:travelseller/custom/images.dart';
import 'package:travelseller/custom/styles.dart';
import 'package:travelseller/custom/titles.dart';
import 'package:travelseller/components/tiles/settings/export_import.dart';
import 'package:travelseller/components/tiles/settings/small_space_tiles.dart';
import 'package:travelseller/components/tiles/settings/space_tiles.dart';
import 'package:travelseller/components/topbar/intern_topbar.dart';
import 'package:travelseller/database/controllers/settings_controller.dart';
import 'package:travelseller/database/model/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SettingsController settingsController = SettingsController();
  List<Settings> settings = [];
  int id = 0;
  bool ida = true,
      volta = true,
      umaHora = true,
      umDia = true,
      doisDias = true,
      limpar = true,
      passar = true;

  @override
  void initState() {
    super.initState();
    settings = settingsController.readAll();

    if (settings.isEmpty) {
      setState(() {
        Settings setting = Settings(
            ida: true,
            volta: true,
            umaHora: false,
            umDia: true,
            doisDias: true,
            limpar: false,
            passar: false);
        id = settingsController.create(setting);
        settings = settingsController.readAll();
      });
    } else {
      id = settings.first.id;
      ida = settings.first.ida;
      volta = settings.first.volta;
      umaHora = settings.first.umaHora;
      umDia = settings.first.umDia;
      doisDias = settings.first.doisDias;
      limpar = settings.first.limpar;
      passar = settings.first.passar;
    }
  }

  @override
  void dispose() {
    salvar(id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    double espaco = 20;

    return PopScope(
        // Função que executa quando sair da página
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          Navigator.pop(context, true);
        },
        canPop: false,
        child: Scaffold(
          body: Column(children: [
            const InternTopbar(
              imagem: CustomImages.imagemConfiguracoes,
              titulo: CustomTitles.tituloConfiguracoes,
              index: 1,
            ),
            SizedBox(
                width: largura * CustomDimens.widthListTiles,
                height: altura * 0.75,
                child: Scrollbar(
                    child: ListView(children: [
                  SizedBox(
                    height: espaco / 2,
                  ),

                  //Tiles Lembretes para ida e volta
                  SizedBox(
                      height: altura * 0.29,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Com quanto tempo de antecedência deseja receber os lembretes?",
                              style: CustomStyles.topicoConfiguracoes,
                            ),
                            SizedBox(
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
                            SizedBox(
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

                  const SpaceTiles(),

                  //Tiles Dias para lembretes
                  SizedBox(
                      height: altura * 0.28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deseja receber lembretes de\nIda e Volta dos clientes?",
                            style: CustomStyles.topicoConfiguracoes,
                          ),
                          SizedBox(
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
                          SizedBox(
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
                  const SpaceTiles(),

                  //Tiles Export
                  const ExportImportSettings(),
                  const SmallSpaceTiles()
                ])))
          ]),
        ));
  }

  salvar(int id) {
    Settings configuracao = Settings(
        ida: ida,
        volta: volta,
        umaHora: umaHora,
        umDia: umDia,
        doisDias: doisDias,
        limpar: limpar,
        passar: passar);
    configuracao.id = id;
    settingsController.update(configuracao);
  }
}
